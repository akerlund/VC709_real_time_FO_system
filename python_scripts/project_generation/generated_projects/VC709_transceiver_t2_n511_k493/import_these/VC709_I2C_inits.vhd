----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 13/03/2017 11:54:45 AM
-- Design Name: 
-- Module Name: VC709_I2C_inits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- A state machine that will read and write I2C data to the different
-- I2C interfaces on the Xilinx VC709 board.
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VC709_I2C_inits is
    port(
        clk           : in std_logic;
        reset_in      : in std_logic;

        -- Signal to the MUX ICs reset pins.
        mux_reset     : out std_logic;

        -- Ports to signal if IDLE, start reading, signaling
        -- when a read is done and its output.
        idle_state    : out std_logic;
        start         : in  std_logic;
        read_done     : out std_logic;
        read_data     : out std_logic_vector(7 downto 0);

        -- Specifies start and stop registers to read from.
        index_start   : in  std_logic_vector(7 downto 0);
        index_stop    : in  std_logic_vector(7 downto 0);
        
        -- Selecting which EEPROM to address:
        -- '0' = A0h.
        -- '1' = A2h.
        SFP_REG_sel   : in  std_logic;
        
        -- Select device to interface with:
        -- '0' = SFP reading.
        -- '1' = Si5324 writing.
        device_sel    : in  std_logic;
        
        -- The I/Os of the I2C.
        sda           : inout  std_logic;
        scl           : inout  std_logic
    );
end VC709_I2C_inits;

architecture arch_VC709_I2C_inits of VC709_I2C_inits is

    -- The I2C component.
    component i2c_master is
    generic(
        input_clk : integer;    --input clock speed from user logic in Hz
        bus_clk   : integer);   --speed the i2c bus (scl) will run at in Hz
    port(
        clk       : in     std_logic;                    --system clock
        reset_n   : in     std_logic;                    --active low reset
        ena       : in     std_logic;                    --latch in command
        addr      : in     std_logic_vector(6 downto 0); --address of target slave
        rw        : in     std_logic;                    --'0' is write, '1' is read
        data_wr   : in     std_logic_vector(7 downto 0); --data to write to slave
        busy      : out    std_logic;                    --indicates transaction in progress
        data_rd   : out    std_logic_vector(7 downto 0); --data read from slave
        ack_error : buffer std_logic;                    --flag if improper acknowledge from slave
        sda       : inout  std_logic;                    --serial data output of i2c bus
        scl       : inout  std_logic                     --serial clock output of i2c bus
    );
    end component;

    -- The I2C signals.
    signal ena       : std_logic;
    signal addr      : std_logic_vector(6 downto 0);
    signal rw        : std_logic;
    signal data_wr   : std_logic_vector(7 downto 0);
    signal busy      : std_logic;
    signal data_rd   : std_logic_vector(7 downto 0);
    signal ack_error : std_logic;

    -- States for reading data, and writing to the Si5324.
    type I2C_states is (
        IDLE,
        RESET_MUX,
        WAIT_FOR_BUSY,
        WAIT_FOR_NOT_BUSY,

        CONF_9548,
        CONF_9548_W_DELAY,
        CONF_9546,
        CONF_9546_W_DELAY,

        ADJUST_MUX,
        READ_SFP_REGISTER_1,
        READ_SFP_REGISTER_2,
        READ_SFP_REGISTER_3,

        READ_SFP_REGISTER_4,
        READ_SFP_REGISTER_5,
        SI5324_WRITE_1,
        SI5324_WRITE_2,

        SI5324_WRITE_3,
        SI5324_WRITE_4
    );

    signal curr_state : I2C_states := IDLE;
    signal next_state : I2C_states := IDLE;

    constant MUX9548_to_SI5324 : std_logic_vector(7 downto 0) := "10000000"; -- Channel 7.
    constant MUX9548_to_SFP    : std_logic_vector(7 downto 0) := "00010000"; -- Channel 4.

    constant MUX9548_ADDRESS : std_logic_vector(6 downto 0) := "1110100"; -- 0x74
    constant MUX9546_ADDRESS : std_logic_vector(6 downto 0) := "1110101"; -- 0x75
    constant SI5324_ADDRESS  : std_logic_vector(6 downto 0) := "1101000"; -- 0x68
    constant SFP_A0h_ADDRESS : std_logic_vector(6 downto 0) := "1010000"; -- 0x50
    constant SFP_A2h_ADDRESS : std_logic_vector(6 downto 0) := "1010001"; -- 0x51

    -- This one is shifted left to select one of the four SFPs through the 9546.    
    signal MUX9546_SFP_CHANNEL : std_logic_vector(7 downto 0) := "00000001";    

    constant SI5324_NR_OF_REG : natural := 43;
    type SI5324_REG_ARRAY is array (0 to 43 - 1) of std_logic_vector(7 downto 0);

    constant SI5324_REG_INDEXES : SI5324_REG_ARRAY := ( 
            x"00", x"01", x"02", x"03", x"04", x"05", x"06", x"07", x"08",
            x"09", x"0a", x"0b", x"13", x"14", x"15", x"16", x"17", x"18",
            x"19", x"1f", x"20", x"21", x"22", x"23", x"24", x"28", x"29",
            x"2a", x"2b", x"2c", x"2d", x"2e", x"2f", x"30", x"37", x"83",
            x"84", x"89", x"8a", x"8b", x"8e", x"8f", x"88");

--    constant SI5324_REG_DATA : SI5324_REG_ARRAY := ( 
--            x"14", x"E4", x"32", x"15", x"92", x"ED", x"2D", x"2A", x"00",
--            x"C0", x"08", x"42", x"29", x"3E", x"FF", x"DF", x"1F", x"3F",
--            x"A0", x"00", x"00", x"03", x"00", x"00", x"03", x"21", x"24",
--            x"F7", x"00", x"1D", x"C2", x"00", x"1D", x"C2", x"00", x"1F",
--            x"02", x"01", x"0F", x"FF", x"00", x"00", x"40");

    -- https://forums.xilinx.com/t5/Networking-and-Connectivity/MGT-clocking-and-SI5324/td-p/535561
    constant SI5324_REG_DATA : SI5324_REG_ARRAY := (            
            x"54", x"E4", x"42", x"15", x"92", x"ED", x"2D", x"2A", x"00",
            x"C0", x"08", x"40", x"29", x"3E", x"FF", x"DF", x"1F", x"3F",
            x"A0", x"00", x"00", x"03", x"00", x"00", x"03", x"60", x"9C",
            x"39", x"00", x"16", x"37", x"00", x"16", x"37", x"00", x"1F",
            x"02", x"01", x"0F", x"FF", x"00", x"00", x"40");

    -- Debug signals
    --signal debu_state : I2C_states := IDLE;
    signal SI5324_index_cnt_debug : natural := 0; 

begin

I2C_comp: component i2c_master
    generic map ( input_clk => 100000000, bus_clk => 100000 )
    port map ( clk => clk, reset_n => reset_in, ena => ena, addr => addr, rw => rw, data_wr => data_wr, busy => busy, data_rd => data_rd, ack_error => ack_error, sda => sda, scl => scl );

--SFP_init_done <= MUX_rdy;
read_data <= data_rd;

init_process:
process(clk, reset_in)
variable mux_rst_cnt : natural := 0;
variable i_curr      : unsigned(7 downto 0);
variable i_start     : unsigned(7 downto 0);
variable i_stop      : unsigned(7 downto 0);

variable SI5324_index_cnt : natural := 0; 

begin



    if reset_in = '0' then

    --debu_state <= IDLE;
    --SI5324_index_cnt_debug <= SI5324_index_cnt_debug;
    

        next_state <= IDLE;
        curr_state <= IDLE;

        ena        <= '0';
        rw         <= '0';         -- Write = '0'.
        read_done  <= '0';
        idle_state <= '1';

        SI5324_index_cnt := 0;
        
    elsif rising_edge(clk) then
        case curr_state is

            when IDLE =>
--debu_state <= IDLE;

                ena             <= '0';
                rw              <= '0';         -- Write = 0, Read = 1.
                read_done       <= '0';
                MUX9546_SFP_CHANNEL <= "00000001";

                if start = '1' then
                    curr_state <= RESET_MUX;
                    i_curr  := unsigned(index_start);
                    i_start := unsigned(index_start);
                    i_stop  := unsigned(index_stop);
                    SI5324_index_cnt := 0;
                    idle_state <= '0';
                else
                    idle_state <= '1';
--SI5324_index_cnt_debug <= 0;
                end if;


            when WAIT_FOR_BUSY =>
                if busy = '1' then
                    curr_state <= next_state;
                end if;


            when WAIT_FOR_NOT_BUSY =>
                if busy = '0' then
                    curr_state <= next_state;
                end if;


            when RESET_MUX =>
--debu_state <= RESET_MUX;      

                if mux_rst_cnt = 20 then
                    mux_reset <= '1';
                    curr_state <= WAIT_FOR_NOT_BUSY;
                    next_state <= CONF_9548;
                else
                    mux_reset <= '0';
                    mux_rst_cnt := mux_rst_cnt + 1;
                end if;


            -- Starting the configuration of the 9548 for MUXing to channel 4.
            when CONF_9548 =>
--debu_state <= CONF_9548;

                ena     <= '1';
                addr    <= MUX9548_ADDRESS;   -- 9548 address.

                if device_sel = '0' then
                    data_wr <= MUX9548_to_SFP;
                else
                    data_wr <= MUX9548_to_SI5324;
                end if;

                curr_state <= WAIT_FOR_BUSY;
                next_state <= CONF_9548_W_DELAY;


            -- Waiting for the 9548 MUX to be configured.
            when CONF_9548_W_DELAY =>
--debu_state <= CONF_9548_W_DELAY;

                -- Once it is started we lower enable as it expects no more bytes.
                ena <= '0';
                curr_state <= WAIT_FOR_NOT_BUSY;
                
                if device_sel = '0' then
                    -- Next the 9546 is configured.
                    next_state <= CONF_9546;
                else
                    -- The 9548 redirects to the Si5324 now.
                    next_state <= SI5324_WRITE_1;
                end if;



            -- Starting the configuration of the 9546 for MUXing to channels 0-3.
            when CONF_9546 =>
--debu_state <= CONF_9546;

                ena     <= '1';
                addr    <= MUX9546_ADDRESS;   -- 9546 address.
                data_wr <= MUX9546_SFP_CHANNEL; -- Select channel.

                curr_state <= WAIT_FOR_BUSY;
                next_state <= CONF_9546_W_DELAY;


            -- Waiting for the MUX to be configured
            -- to the right channel for next SFP.
            when CONF_9546_W_DELAY =>
--debu_state <= CONF_9546_W_DELAY;

                ena <= '0';
                curr_state <= WAIT_FOR_NOT_BUSY;
                next_state <= READ_SFP_REGISTER_1;


            when ADJUST_MUX =>
--debu_state <= ADJUST_MUX;

                read_done <= '0';

                if MUX9546_SFP_CHANNEL = "00001000" then
                    curr_state <= IDLE;
                else
                    rw         <= '0';         -- Write.
                    curr_state <= CONF_9546;
                    MUX9546_SFP_CHANNEL <= std_logic_vector(shift_left(unsigned(MUX9546_SFP_CHANNEL),1));
                end if;


            when READ_SFP_REGISTER_1 =>  -- Init reading by writing the index.
--debu_state <= READ_SFP_REGISTER_1;

                ena     <= '1';
                rw      <= '0';         -- Write.

                if SFP_REG_sel = '0' then
                    addr    <= SFP_A0h_ADDRESS; -- SFP reg address.
                else
                    addr    <= SFP_A2h_ADDRESS;
                end if;

                data_wr    <= std_logic_vector(i_curr);
                curr_state <= WAIT_FOR_BUSY;
                next_state <= READ_SFP_REGISTER_2;

                read_done <= '0';

            when READ_SFP_REGISTER_2 =>  -- Writing address to read from.
--debu_state <= READ_SFP_REGISTER_2;
                ena     <= '1';
                rw      <= '1';         -- Read.
                curr_state <= WAIT_FOR_NOT_BUSY;
                next_state <= READ_SFP_REGISTER_3;

            when READ_SFP_REGISTER_3 =>  -- Start reading from the index.
--debu_state <= READ_SFP_REGISTER_3;

                read_done <= '0';
                curr_state <= WAIT_FOR_BUSY;
                next_state <= READ_SFP_REGISTER_4;
                i_curr := i_curr + 1;

            when READ_SFP_REGISTER_4 => -- Reading from the device.
--debu_state <= READ_SFP_REGISTER_4;


                next_state <= READ_SFP_REGISTER_5;
                curr_state <= WAIT_FOR_NOT_BUSY;

                if i_curr = i_stop then
                    ena     <= '0';
                end if; 

            when READ_SFP_REGISTER_5 => -- Reading
--debu_state <= READ_SFP_REGISTER_5;

                read_done <= '1';

                if i_curr /= i_stop then     
                    curr_state <= READ_SFP_REGISTER_3;
                else
                    next_state <= ADJUST_MUX;
                    curr_state <= ADJUST_MUX;
                    i_curr := i_start;
                end if;




            when SI5324_WRITE_1 =>
--debu_state <= SI5324_WRITE_1;

                -- This first state send the address and a registers index.

                ena     <= '1';                 -- Enable.
                rw      <= '0';                 -- Set to write.
                addr    <= SI5324_ADDRESS;      -- The SI5324 address.

                -- Register selection.
                data_wr <= SI5324_REG_INDEXES(SI5324_index_cnt);


                curr_state <= WAIT_FOR_BUSY;
                next_state <= SI5324_WRITE_2;


            when SI5324_WRITE_2 =>
--debu_state <= SI5324_WRITE_2;

                -- Now the I2C is busy writing to the SI5324 so we
                -- load the next byte which is the data to the register

                data_wr <= SI5324_REG_DATA(SI5324_index_cnt);

                curr_state <= WAIT_FOR_NOT_BUSY;
                next_state <= SI5324_WRITE_3;


            when SI5324_WRITE_3 =>
--debu_state <= SI5324_WRITE_3;

                -- By now the SI5324 has recieved the register index.
                -- Here we just increment out pointer and start waiting
                -- for the I2C to be busy sending the data.

                SI5324_index_cnt := SI5324_index_cnt + 1;
--SI5324_index_cnt_debug <= SI5324_index_cnt_debug+ 1;
                curr_state <= WAIT_FOR_BUSY;
                next_state <= SI5324_WRITE_4;   


            when SI5324_WRITE_4 =>
--debu_state <= SI5324_WRITE_4;

                -- Now we are sending the data, we just have to wait
                -- for it to signal not busy. Then we can continue writing
                -- or return to the IDLE state. So therefore we have to set enable
                -- to zero here so the I2C wont send the same data byte again.

                ena        <= '0';
                curr_state <= WAIT_FOR_NOT_BUSY;  

                if SI5324_index_cnt /= SI5324_NR_OF_REG then
                    next_state <= SI5324_WRITE_1;
                else
                    next_state <= IDLE;
                end if;

            when OTHERS =>

        end case;
    end if;

end process;

end arch_VC709_I2C_inits;