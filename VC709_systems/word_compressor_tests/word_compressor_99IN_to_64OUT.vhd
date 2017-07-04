----------------------------------------------------------------------------------
    -- Company:  Chalmers
    -- Engineer: Fredrik Åkerlund
    -- 
    -- Create Date: Mon Jul  3 13:58:32 2017

    -- Design Name: 
    -- Module Name: word_compressor_99IN_to_64OUT - arch_word_compressor_99IN_to_64OUT
    -- Project Name: 
    -- Target Devices: 
    -- Tool Versions: 
    -- Description: 
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
    -- use IEEE.NUMERIC_STD.ALL;

    -- Uncomment the following library declaration if instantiating
    -- any Xilinx leaf cells in this code.
    --library UNISIM;
    --use UNISIM.VComponents.all;
    entity word_compressor_99IN_to_64OUT is

    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

        data_in        : in  std_logic_vector(98 downto 0);
        in_rdy         : in  std_logic;

        buf_out        : out std_logic_vector(63 downto 0);
        out_rdy        : out std_logic

    );
    end word_compressor_99IN_to_64OUT;

architecture arch_word_compressor_99IN_to_64OUT of word_compressor_99IN_to_64OUT is

    -- Input registers.
    signal buf_input_r    : std_logic_vector(197 downto 0);
    signal bits_in_buffer : integer range 0 to 198;

    -- Output registers.
    signal buf_output_r : std_logic_vector(63 downto 0);
    signal out_rdy_r    : std_logic;


    begin

    output_reg_process:
    process(reset_in, user_clk, enable_in)
    begin
        if reset_in = '0' then
            buf_out <= (others=>'0');
            out_rdy <= '0';
        elsif rising_edge(user_clk) and enable_in = '1' then
            buf_out <= buf_output_r;
            out_rdy <= out_rdy_r;
        end if;
    end process;

    the_buffing_process:
    process(reset_in, user_clk, enable_in)
    begin

        if reset_in = '0' then

            buf_input_r    <= (others=>'0');
            bits_in_buffer <= 0;

            buf_output_r   <= (others=>'0');
            out_rdy_r      <= '0';

            congestion_out <= '0';

        elsif rising_edge(user_clk) and enable_in = '1' then

    

        -- If bits_in_buffer is less than 64, the output will consist
        --   of both the input and the buffer.

        case bits_in_buffer is
        when 0 =>
            if in_rdy = '1' then
                buf_output_r(63 downto 0)    <= data_in(63 downto 0);
                buf_input_r(34 downto 0)     <= data_in(98 downto 64);
                bits_in_buffer               <= 35;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 1 =>
            if in_rdy = '1' then
                buf_output_r(0 downto 0)     <= buf_input_r(0 downto 0);
                buf_output_r(63 downto 1)    <= data_in(62 downto 0);
                buf_input_r(35 downto 0)     <= data_in(98 downto 63);
                bits_in_buffer               <= 36;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 2 =>
            if in_rdy = '1' then
                buf_output_r(1 downto 0)     <= buf_input_r(1 downto 0);
                buf_output_r(63 downto 2)    <= data_in(61 downto 0);
                buf_input_r(36 downto 0)     <= data_in(98 downto 62);
                bits_in_buffer               <= 37;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 3 =>
            if in_rdy = '1' then
                buf_output_r(2 downto 0)     <= buf_input_r(2 downto 0);
                buf_output_r(63 downto 3)    <= data_in(60 downto 0);
                buf_input_r(37 downto 0)     <= data_in(98 downto 61);
                bits_in_buffer               <= 38;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 4 =>
            if in_rdy = '1' then
                buf_output_r(3 downto 0)     <= buf_input_r(3 downto 0);
                buf_output_r(63 downto 4)    <= data_in(59 downto 0);
                buf_input_r(38 downto 0)     <= data_in(98 downto 60);
                bits_in_buffer               <= 39;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 5 =>
            if in_rdy = '1' then
                buf_output_r(4 downto 0)     <= buf_input_r(4 downto 0);
                buf_output_r(63 downto 5)    <= data_in(58 downto 0);
                buf_input_r(39 downto 0)     <= data_in(98 downto 59);
                bits_in_buffer               <= 40;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 6 =>
            if in_rdy = '1' then
                buf_output_r(5 downto 0)     <= buf_input_r(5 downto 0);
                buf_output_r(63 downto 6)    <= data_in(57 downto 0);
                buf_input_r(40 downto 0)     <= data_in(98 downto 58);
                bits_in_buffer               <= 41;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 7 =>
            if in_rdy = '1' then
                buf_output_r(6 downto 0)     <= buf_input_r(6 downto 0);
                buf_output_r(63 downto 7)    <= data_in(56 downto 0);
                buf_input_r(41 downto 0)     <= data_in(98 downto 57);
                bits_in_buffer               <= 42;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 8 =>
            if in_rdy = '1' then
                buf_output_r(7 downto 0)     <= buf_input_r(7 downto 0);
                buf_output_r(63 downto 8)    <= data_in(55 downto 0);
                buf_input_r(42 downto 0)     <= data_in(98 downto 56);
                bits_in_buffer               <= 43;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 9 =>
            if in_rdy = '1' then
                buf_output_r(8 downto 0)     <= buf_input_r(8 downto 0);
                buf_output_r(63 downto 9)    <= data_in(54 downto 0);
                buf_input_r(43 downto 0)     <= data_in(98 downto 55);
                bits_in_buffer               <= 44;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 10 =>
            if in_rdy = '1' then
                buf_output_r(9 downto 0)     <= buf_input_r(9 downto 0);
                buf_output_r(63 downto 10)   <= data_in(53 downto 0);
                buf_input_r(44 downto 0)     <= data_in(98 downto 54);
                bits_in_buffer               <= 45;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 11 =>
            if in_rdy = '1' then
                buf_output_r(10 downto 0)    <= buf_input_r(10 downto 0);
                buf_output_r(63 downto 11)   <= data_in(52 downto 0);
                buf_input_r(45 downto 0)     <= data_in(98 downto 53);
                bits_in_buffer               <= 46;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 12 =>
            if in_rdy = '1' then
                buf_output_r(11 downto 0)    <= buf_input_r(11 downto 0);
                buf_output_r(63 downto 12)   <= data_in(51 downto 0);
                buf_input_r(46 downto 0)     <= data_in(98 downto 52);
                bits_in_buffer               <= 47;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 13 =>
            if in_rdy = '1' then
                buf_output_r(12 downto 0)    <= buf_input_r(12 downto 0);
                buf_output_r(63 downto 13)   <= data_in(50 downto 0);
                buf_input_r(47 downto 0)     <= data_in(98 downto 51);
                bits_in_buffer               <= 48;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 14 =>
            if in_rdy = '1' then
                buf_output_r(13 downto 0)    <= buf_input_r(13 downto 0);
                buf_output_r(63 downto 14)   <= data_in(49 downto 0);
                buf_input_r(48 downto 0)     <= data_in(98 downto 50);
                bits_in_buffer               <= 49;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 15 =>
            if in_rdy = '1' then
                buf_output_r(14 downto 0)    <= buf_input_r(14 downto 0);
                buf_output_r(63 downto 15)   <= data_in(48 downto 0);
                buf_input_r(49 downto 0)     <= data_in(98 downto 49);
                bits_in_buffer               <= 50;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 16 =>
            if in_rdy = '1' then
                buf_output_r(15 downto 0)    <= buf_input_r(15 downto 0);
                buf_output_r(63 downto 16)   <= data_in(47 downto 0);
                buf_input_r(50 downto 0)     <= data_in(98 downto 48);
                bits_in_buffer               <= 51;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 17 =>
            if in_rdy = '1' then
                buf_output_r(16 downto 0)    <= buf_input_r(16 downto 0);
                buf_output_r(63 downto 17)   <= data_in(46 downto 0);
                buf_input_r(51 downto 0)     <= data_in(98 downto 47);
                bits_in_buffer               <= 52;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 18 =>
            if in_rdy = '1' then
                buf_output_r(17 downto 0)    <= buf_input_r(17 downto 0);
                buf_output_r(63 downto 18)   <= data_in(45 downto 0);
                buf_input_r(52 downto 0)     <= data_in(98 downto 46);
                bits_in_buffer               <= 53;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 19 =>
            if in_rdy = '1' then
                buf_output_r(18 downto 0)    <= buf_input_r(18 downto 0);
                buf_output_r(63 downto 19)   <= data_in(44 downto 0);
                buf_input_r(53 downto 0)     <= data_in(98 downto 45);
                bits_in_buffer               <= 54;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 20 =>
            if in_rdy = '1' then
                buf_output_r(19 downto 0)    <= buf_input_r(19 downto 0);
                buf_output_r(63 downto 20)   <= data_in(43 downto 0);
                buf_input_r(54 downto 0)     <= data_in(98 downto 44);
                bits_in_buffer               <= 55;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 21 =>
            if in_rdy = '1' then
                buf_output_r(20 downto 0)    <= buf_input_r(20 downto 0);
                buf_output_r(63 downto 21)   <= data_in(42 downto 0);
                buf_input_r(55 downto 0)     <= data_in(98 downto 43);
                bits_in_buffer               <= 56;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 22 =>
            if in_rdy = '1' then
                buf_output_r(21 downto 0)    <= buf_input_r(21 downto 0);
                buf_output_r(63 downto 22)   <= data_in(41 downto 0);
                buf_input_r(56 downto 0)     <= data_in(98 downto 42);
                bits_in_buffer               <= 57;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 23 =>
            if in_rdy = '1' then
                buf_output_r(22 downto 0)    <= buf_input_r(22 downto 0);
                buf_output_r(63 downto 23)   <= data_in(40 downto 0);
                buf_input_r(57 downto 0)     <= data_in(98 downto 41);
                bits_in_buffer               <= 58;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 24 =>
            if in_rdy = '1' then
                buf_output_r(23 downto 0)    <= buf_input_r(23 downto 0);
                buf_output_r(63 downto 24)   <= data_in(39 downto 0);
                buf_input_r(58 downto 0)     <= data_in(98 downto 40);
                bits_in_buffer               <= 59;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 25 =>
            if in_rdy = '1' then
                buf_output_r(24 downto 0)    <= buf_input_r(24 downto 0);
                buf_output_r(63 downto 25)   <= data_in(38 downto 0);
                buf_input_r(59 downto 0)     <= data_in(98 downto 39);
                bits_in_buffer               <= 60;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 26 =>
            if in_rdy = '1' then
                buf_output_r(25 downto 0)    <= buf_input_r(25 downto 0);
                buf_output_r(63 downto 26)   <= data_in(37 downto 0);
                buf_input_r(60 downto 0)     <= data_in(98 downto 38);
                bits_in_buffer               <= 61;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 27 =>
            if in_rdy = '1' then
                buf_output_r(26 downto 0)    <= buf_input_r(26 downto 0);
                buf_output_r(63 downto 27)   <= data_in(36 downto 0);
                buf_input_r(61 downto 0)     <= data_in(98 downto 37);
                bits_in_buffer               <= 62;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 28 =>
            if in_rdy = '1' then
                buf_output_r(27 downto 0)    <= buf_input_r(27 downto 0);
                buf_output_r(63 downto 28)   <= data_in(35 downto 0);
                buf_input_r(62 downto 0)     <= data_in(98 downto 36);
                bits_in_buffer               <= 63;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 29 =>
            if in_rdy = '1' then
                buf_output_r(28 downto 0)    <= buf_input_r(28 downto 0);
                buf_output_r(63 downto 29)   <= data_in(34 downto 0);
                buf_input_r(63 downto 0)     <= data_in(98 downto 35);
                bits_in_buffer               <= 64;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 30 =>
            if in_rdy = '1' then
                buf_output_r(29 downto 0)    <= buf_input_r(29 downto 0);
                buf_output_r(63 downto 30)   <= data_in(33 downto 0);
                buf_input_r(64 downto 0)     <= data_in(98 downto 34);
                bits_in_buffer               <= 65;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 31 =>
            if in_rdy = '1' then
                buf_output_r(30 downto 0)    <= buf_input_r(30 downto 0);
                buf_output_r(63 downto 31)   <= data_in(32 downto 0);
                buf_input_r(65 downto 0)     <= data_in(98 downto 33);
                bits_in_buffer               <= 66;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 32 =>
            if in_rdy = '1' then
                buf_output_r(31 downto 0)    <= buf_input_r(31 downto 0);
                buf_output_r(63 downto 32)   <= data_in(31 downto 0);
                buf_input_r(66 downto 0)     <= data_in(98 downto 32);
                bits_in_buffer               <= 67;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 33 =>
            if in_rdy = '1' then
                buf_output_r(32 downto 0)    <= buf_input_r(32 downto 0);
                buf_output_r(63 downto 33)   <= data_in(30 downto 0);
                buf_input_r(67 downto 0)     <= data_in(98 downto 31);
                bits_in_buffer               <= 68;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 34 =>
            if in_rdy = '1' then
                buf_output_r(33 downto 0)    <= buf_input_r(33 downto 0);
                buf_output_r(63 downto 34)   <= data_in(29 downto 0);
                buf_input_r(68 downto 0)     <= data_in(98 downto 30);
                bits_in_buffer               <= 69;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 35 =>
            if in_rdy = '1' then
                buf_output_r(34 downto 0)    <= buf_input_r(34 downto 0);
                buf_output_r(63 downto 35)   <= data_in(28 downto 0);
                buf_input_r(69 downto 0)     <= data_in(98 downto 29);
                bits_in_buffer               <= 70;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 36 =>
            if in_rdy = '1' then
                buf_output_r(35 downto 0)    <= buf_input_r(35 downto 0);
                buf_output_r(63 downto 36)   <= data_in(27 downto 0);
                buf_input_r(70 downto 0)     <= data_in(98 downto 28);
                bits_in_buffer               <= 71;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 37 =>
            if in_rdy = '1' then
                buf_output_r(36 downto 0)    <= buf_input_r(36 downto 0);
                buf_output_r(63 downto 37)   <= data_in(26 downto 0);
                buf_input_r(71 downto 0)     <= data_in(98 downto 27);
                bits_in_buffer               <= 72;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 38 =>
            if in_rdy = '1' then
                buf_output_r(37 downto 0)    <= buf_input_r(37 downto 0);
                buf_output_r(63 downto 38)   <= data_in(25 downto 0);
                buf_input_r(72 downto 0)     <= data_in(98 downto 26);
                bits_in_buffer               <= 73;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 39 =>
            if in_rdy = '1' then
                buf_output_r(38 downto 0)    <= buf_input_r(38 downto 0);
                buf_output_r(63 downto 39)   <= data_in(24 downto 0);
                buf_input_r(73 downto 0)     <= data_in(98 downto 25);
                bits_in_buffer               <= 74;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 40 =>
            if in_rdy = '1' then
                buf_output_r(39 downto 0)    <= buf_input_r(39 downto 0);
                buf_output_r(63 downto 40)   <= data_in(23 downto 0);
                buf_input_r(74 downto 0)     <= data_in(98 downto 24);
                bits_in_buffer               <= 75;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 41 =>
            if in_rdy = '1' then
                buf_output_r(40 downto 0)    <= buf_input_r(40 downto 0);
                buf_output_r(63 downto 41)   <= data_in(22 downto 0);
                buf_input_r(75 downto 0)     <= data_in(98 downto 23);
                bits_in_buffer               <= 76;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 42 =>
            if in_rdy = '1' then
                buf_output_r(41 downto 0)    <= buf_input_r(41 downto 0);
                buf_output_r(63 downto 42)   <= data_in(21 downto 0);
                buf_input_r(76 downto 0)     <= data_in(98 downto 22);
                bits_in_buffer               <= 77;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 43 =>
            if in_rdy = '1' then
                buf_output_r(42 downto 0)    <= buf_input_r(42 downto 0);
                buf_output_r(63 downto 43)   <= data_in(20 downto 0);
                buf_input_r(77 downto 0)     <= data_in(98 downto 21);
                bits_in_buffer               <= 78;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 44 =>
            if in_rdy = '1' then
                buf_output_r(43 downto 0)    <= buf_input_r(43 downto 0);
                buf_output_r(63 downto 44)   <= data_in(19 downto 0);
                buf_input_r(78 downto 0)     <= data_in(98 downto 20);
                bits_in_buffer               <= 79;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 45 =>
            if in_rdy = '1' then
                buf_output_r(44 downto 0)    <= buf_input_r(44 downto 0);
                buf_output_r(63 downto 45)   <= data_in(18 downto 0);
                buf_input_r(79 downto 0)     <= data_in(98 downto 19);
                bits_in_buffer               <= 80;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 46 =>
            if in_rdy = '1' then
                buf_output_r(45 downto 0)    <= buf_input_r(45 downto 0);
                buf_output_r(63 downto 46)   <= data_in(17 downto 0);
                buf_input_r(80 downto 0)     <= data_in(98 downto 18);
                bits_in_buffer               <= 81;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 47 =>
            if in_rdy = '1' then
                buf_output_r(46 downto 0)    <= buf_input_r(46 downto 0);
                buf_output_r(63 downto 47)   <= data_in(16 downto 0);
                buf_input_r(81 downto 0)     <= data_in(98 downto 17);
                bits_in_buffer               <= 82;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 48 =>
            if in_rdy = '1' then
                buf_output_r(47 downto 0)    <= buf_input_r(47 downto 0);
                buf_output_r(63 downto 48)   <= data_in(15 downto 0);
                buf_input_r(82 downto 0)     <= data_in(98 downto 16);
                bits_in_buffer               <= 83;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 49 =>
            if in_rdy = '1' then
                buf_output_r(48 downto 0)    <= buf_input_r(48 downto 0);
                buf_output_r(63 downto 49)   <= data_in(14 downto 0);
                buf_input_r(83 downto 0)     <= data_in(98 downto 15);
                bits_in_buffer               <= 84;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 50 =>
            if in_rdy = '1' then
                buf_output_r(49 downto 0)    <= buf_input_r(49 downto 0);
                buf_output_r(63 downto 50)   <= data_in(13 downto 0);
                buf_input_r(84 downto 0)     <= data_in(98 downto 14);
                bits_in_buffer               <= 85;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 51 =>
            if in_rdy = '1' then
                buf_output_r(50 downto 0)    <= buf_input_r(50 downto 0);
                buf_output_r(63 downto 51)   <= data_in(12 downto 0);
                buf_input_r(85 downto 0)     <= data_in(98 downto 13);
                bits_in_buffer               <= 86;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 52 =>
            if in_rdy = '1' then
                buf_output_r(51 downto 0)    <= buf_input_r(51 downto 0);
                buf_output_r(63 downto 52)   <= data_in(11 downto 0);
                buf_input_r(86 downto 0)     <= data_in(98 downto 12);
                bits_in_buffer               <= 87;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 53 =>
            if in_rdy = '1' then
                buf_output_r(52 downto 0)    <= buf_input_r(52 downto 0);
                buf_output_r(63 downto 53)   <= data_in(10 downto 0);
                buf_input_r(87 downto 0)     <= data_in(98 downto 11);
                bits_in_buffer               <= 88;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 54 =>
            if in_rdy = '1' then
                buf_output_r(53 downto 0)    <= buf_input_r(53 downto 0);
                buf_output_r(63 downto 54)   <= data_in(9 downto 0);
                buf_input_r(88 downto 0)     <= data_in(98 downto 10);
                bits_in_buffer               <= 89;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 55 =>
            if in_rdy = '1' then
                buf_output_r(54 downto 0)    <= buf_input_r(54 downto 0);
                buf_output_r(63 downto 55)   <= data_in(8 downto 0);
                buf_input_r(89 downto 0)     <= data_in(98 downto 9);
                bits_in_buffer               <= 90;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 56 =>
            if in_rdy = '1' then
                buf_output_r(55 downto 0)    <= buf_input_r(55 downto 0);
                buf_output_r(63 downto 56)   <= data_in(7 downto 0);
                buf_input_r(90 downto 0)     <= data_in(98 downto 8);
                bits_in_buffer               <= 91;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 57 =>
            if in_rdy = '1' then
                buf_output_r(56 downto 0)    <= buf_input_r(56 downto 0);
                buf_output_r(63 downto 57)   <= data_in(6 downto 0);
                buf_input_r(91 downto 0)     <= data_in(98 downto 7);
                bits_in_buffer               <= 92;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 58 =>
            if in_rdy = '1' then
                buf_output_r(57 downto 0)    <= buf_input_r(57 downto 0);
                buf_output_r(63 downto 58)   <= data_in(5 downto 0);
                buf_input_r(92 downto 0)     <= data_in(98 downto 6);
                bits_in_buffer               <= 93;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 59 =>
            if in_rdy = '1' then
                buf_output_r(58 downto 0)    <= buf_input_r(58 downto 0);
                buf_output_r(63 downto 59)   <= data_in(4 downto 0);
                buf_input_r(93 downto 0)     <= data_in(98 downto 5);
                bits_in_buffer               <= 94;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 60 =>
            if in_rdy = '1' then
                buf_output_r(59 downto 0)    <= buf_input_r(59 downto 0);
                buf_output_r(63 downto 60)   <= data_in(3 downto 0);
                buf_input_r(94 downto 0)     <= data_in(98 downto 4);
                bits_in_buffer               <= 95;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 61 =>
            if in_rdy = '1' then
                buf_output_r(60 downto 0)    <= buf_input_r(60 downto 0);
                buf_output_r(63 downto 61)   <= data_in(2 downto 0);
                buf_input_r(95 downto 0)     <= data_in(98 downto 3);
                bits_in_buffer               <= 96;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 62 =>
            if in_rdy = '1' then
                buf_output_r(61 downto 0)    <= buf_input_r(61 downto 0);
                buf_output_r(63 downto 62)   <= data_in(1 downto 0);
                buf_input_r(96 downto 0)     <= data_in(98 downto 2);
                bits_in_buffer               <= 97;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';
        when 63 =>
            if in_rdy = '1' then
                buf_output_r(62 downto 0)    <= buf_input_r(62 downto 0);
                buf_output_r(63 downto 63)   <= data_in(0 downto 0);
                buf_input_r(97 downto 0)     <= data_in(98 downto 1);
                bits_in_buffer               <= 98;
                out_rdy_r                    <= '1';
            else
                out_rdy_r                    <= '0';
            end if;
            congestion_out                   <= '0';


        -- For this range, the buffer has enough bits saved for the output.

        when 64 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            if in_rdy = '1' then
                buf_input_r(98 downto 0)     <= data_in(98 downto 0);
                buf_input_r(197 downto 99)   <= data_in(98 downto 0);
                bits_in_buffer               <= 99;
            else
                bits_in_buffer               <= 0;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 65 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(0 downto 0)          <= buf_input_r(64 downto 64);
            if in_rdy = '1' then
                buf_input_r(99 downto 1)     <= data_in(98 downto 0);
                bits_in_buffer               <= 100;
            else
                bits_in_buffer               <= 1;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 66 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(1 downto 0)          <= buf_input_r(65 downto 64);
            if in_rdy = '1' then
                buf_input_r(100 downto 2)    <= data_in(98 downto 0);
                bits_in_buffer               <= 101;
            else
                bits_in_buffer               <= 2;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 67 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(2 downto 0)          <= buf_input_r(66 downto 64);
            if in_rdy = '1' then
                buf_input_r(101 downto 3)    <= data_in(98 downto 0);
                bits_in_buffer               <= 102;
            else
                bits_in_buffer               <= 3;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 68 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(3 downto 0)          <= buf_input_r(67 downto 64);
            if in_rdy = '1' then
                buf_input_r(102 downto 4)    <= data_in(98 downto 0);
                bits_in_buffer               <= 103;
            else
                bits_in_buffer               <= 4;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 69 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(4 downto 0)          <= buf_input_r(68 downto 64);
            if in_rdy = '1' then
                buf_input_r(103 downto 5)    <= data_in(98 downto 0);
                bits_in_buffer               <= 104;
            else
                bits_in_buffer               <= 5;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 70 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(5 downto 0)          <= buf_input_r(69 downto 64);
            if in_rdy = '1' then
                buf_input_r(104 downto 6)    <= data_in(98 downto 0);
                bits_in_buffer               <= 105;
            else
                bits_in_buffer               <= 6;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 71 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(6 downto 0)          <= buf_input_r(70 downto 64);
            if in_rdy = '1' then
                buf_input_r(105 downto 7)    <= data_in(98 downto 0);
                bits_in_buffer               <= 106;
            else
                bits_in_buffer               <= 7;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 72 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(7 downto 0)          <= buf_input_r(71 downto 64);
            if in_rdy = '1' then
                buf_input_r(106 downto 8)    <= data_in(98 downto 0);
                bits_in_buffer               <= 107;
            else
                bits_in_buffer               <= 8;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 73 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(8 downto 0)          <= buf_input_r(72 downto 64);
            if in_rdy = '1' then
                buf_input_r(107 downto 9)    <= data_in(98 downto 0);
                bits_in_buffer               <= 108;
            else
                bits_in_buffer               <= 9;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 74 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(9 downto 0)          <= buf_input_r(73 downto 64);
            if in_rdy = '1' then
                buf_input_r(108 downto 10)   <= data_in(98 downto 0);
                bits_in_buffer               <= 109;
            else
                bits_in_buffer               <= 10;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 75 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(10 downto 0)         <= buf_input_r(74 downto 64);
            if in_rdy = '1' then
                buf_input_r(109 downto 11)   <= data_in(98 downto 0);
                bits_in_buffer               <= 110;
            else
                bits_in_buffer               <= 11;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 76 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(11 downto 0)         <= buf_input_r(75 downto 64);
            if in_rdy = '1' then
                buf_input_r(110 downto 12)   <= data_in(98 downto 0);
                bits_in_buffer               <= 111;
            else
                bits_in_buffer               <= 12;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 77 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(12 downto 0)         <= buf_input_r(76 downto 64);
            if in_rdy = '1' then
                buf_input_r(111 downto 13)   <= data_in(98 downto 0);
                bits_in_buffer               <= 112;
            else
                bits_in_buffer               <= 13;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 78 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(13 downto 0)         <= buf_input_r(77 downto 64);
            if in_rdy = '1' then
                buf_input_r(112 downto 14)   <= data_in(98 downto 0);
                bits_in_buffer               <= 113;
            else
                bits_in_buffer               <= 14;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 79 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(14 downto 0)         <= buf_input_r(78 downto 64);
            if in_rdy = '1' then
                buf_input_r(113 downto 15)   <= data_in(98 downto 0);
                bits_in_buffer               <= 114;
            else
                bits_in_buffer               <= 15;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 80 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(15 downto 0)         <= buf_input_r(79 downto 64);
            if in_rdy = '1' then
                buf_input_r(114 downto 16)   <= data_in(98 downto 0);
                bits_in_buffer               <= 115;
            else
                bits_in_buffer               <= 16;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 81 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(16 downto 0)         <= buf_input_r(80 downto 64);
            if in_rdy = '1' then
                buf_input_r(115 downto 17)   <= data_in(98 downto 0);
                bits_in_buffer               <= 116;
            else
                bits_in_buffer               <= 17;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 82 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(17 downto 0)         <= buf_input_r(81 downto 64);
            if in_rdy = '1' then
                buf_input_r(116 downto 18)   <= data_in(98 downto 0);
                bits_in_buffer               <= 117;
            else
                bits_in_buffer               <= 18;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 83 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(18 downto 0)         <= buf_input_r(82 downto 64);
            if in_rdy = '1' then
                buf_input_r(117 downto 19)   <= data_in(98 downto 0);
                bits_in_buffer               <= 118;
            else
                bits_in_buffer               <= 19;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 84 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(19 downto 0)         <= buf_input_r(83 downto 64);
            if in_rdy = '1' then
                buf_input_r(118 downto 20)   <= data_in(98 downto 0);
                bits_in_buffer               <= 119;
            else
                bits_in_buffer               <= 20;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 85 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(20 downto 0)         <= buf_input_r(84 downto 64);
            if in_rdy = '1' then
                buf_input_r(119 downto 21)   <= data_in(98 downto 0);
                bits_in_buffer               <= 120;
            else
                bits_in_buffer               <= 21;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 86 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(21 downto 0)         <= buf_input_r(85 downto 64);
            if in_rdy = '1' then
                buf_input_r(120 downto 22)   <= data_in(98 downto 0);
                bits_in_buffer               <= 121;
            else
                bits_in_buffer               <= 22;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 87 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(22 downto 0)         <= buf_input_r(86 downto 64);
            if in_rdy = '1' then
                buf_input_r(121 downto 23)   <= data_in(98 downto 0);
                bits_in_buffer               <= 122;
            else
                bits_in_buffer               <= 23;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 88 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(23 downto 0)         <= buf_input_r(87 downto 64);
            if in_rdy = '1' then
                buf_input_r(122 downto 24)   <= data_in(98 downto 0);
                bits_in_buffer               <= 123;
            else
                bits_in_buffer               <= 24;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 89 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(24 downto 0)         <= buf_input_r(88 downto 64);
            if in_rdy = '1' then
                buf_input_r(123 downto 25)   <= data_in(98 downto 0);
                bits_in_buffer               <= 124;
            else
                bits_in_buffer               <= 25;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 90 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(25 downto 0)         <= buf_input_r(89 downto 64);
            if in_rdy = '1' then
                buf_input_r(124 downto 26)   <= data_in(98 downto 0);
                bits_in_buffer               <= 125;
            else
                bits_in_buffer               <= 26;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 91 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(26 downto 0)         <= buf_input_r(90 downto 64);
            if in_rdy = '1' then
                buf_input_r(125 downto 27)   <= data_in(98 downto 0);
                bits_in_buffer               <= 126;
            else
                bits_in_buffer               <= 27;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 92 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(27 downto 0)         <= buf_input_r(91 downto 64);
            if in_rdy = '1' then
                buf_input_r(126 downto 28)   <= data_in(98 downto 0);
                bits_in_buffer               <= 127;
            else
                bits_in_buffer               <= 28;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 93 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(28 downto 0)         <= buf_input_r(92 downto 64);
            if in_rdy = '1' then
                buf_input_r(127 downto 29)   <= data_in(98 downto 0);
                bits_in_buffer               <= 128;
            else
                bits_in_buffer               <= 29;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 94 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(29 downto 0)         <= buf_input_r(93 downto 64);
            if in_rdy = '1' then
                buf_input_r(128 downto 30)   <= data_in(98 downto 0);
                bits_in_buffer               <= 129;
            else
                bits_in_buffer               <= 30;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 95 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(30 downto 0)         <= buf_input_r(94 downto 64);
            if in_rdy = '1' then
                buf_input_r(129 downto 31)   <= data_in(98 downto 0);
                bits_in_buffer               <= 130;
            else
                bits_in_buffer               <= 31;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 96 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(31 downto 0)         <= buf_input_r(95 downto 64);
            if in_rdy = '1' then
                buf_input_r(130 downto 32)   <= data_in(98 downto 0);
                bits_in_buffer               <= 131;
            else
                bits_in_buffer               <= 32;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 97 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(32 downto 0)         <= buf_input_r(96 downto 64);
            if in_rdy = '1' then
                buf_input_r(131 downto 33)   <= data_in(98 downto 0);
                bits_in_buffer               <= 132;
            else
                bits_in_buffer               <= 33;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 98 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(33 downto 0)         <= buf_input_r(97 downto 64);
            if in_rdy = '1' then
                buf_input_r(132 downto 34)   <= data_in(98 downto 0);
                bits_in_buffer               <= 133;
            else
                bits_in_buffer               <= 34;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 99 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(34 downto 0)         <= buf_input_r(98 downto 64);
            if in_rdy = '1' then
                buf_input_r(133 downto 35)   <= data_in(98 downto 0);
                bits_in_buffer               <= 134;
            else
                bits_in_buffer               <= 35;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';
        when 100 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(35 downto 0)         <= buf_input_r(99 downto 64);
            if in_rdy = '1' then
                buf_input_r(134 downto 36)   <= data_in(98 downto 0);
                bits_in_buffer               <= 135;
            else
                bits_in_buffer               <= 36;
            end if;
            congestion_out                   <= '0';
            out_rdy_r                        <= '1';


        -- For this range, congestion_out is asserted if in_rdy = '1'.
        -- Because the minimum bits_in_buffer here if in_rdy = '1', is 164. Maximum is 198.
        -- Therefore there is no space left for another input since; 164(in buffer) + 99(input) - 64(out) = 199 > 198(size).

        when 101 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(36 downto 0)         <= buf_input_r(100 downto 64);
            if in_rdy = '1' then
                buf_input_r(135 downto 37)   <= data_in(98 downto 0);
                bits_in_buffer               <= 136;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 37;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 102 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(37 downto 0)         <= buf_input_r(101 downto 64);
            if in_rdy = '1' then
                buf_input_r(136 downto 38)   <= data_in(98 downto 0);
                bits_in_buffer               <= 137;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 38;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 103 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(38 downto 0)         <= buf_input_r(102 downto 64);
            if in_rdy = '1' then
                buf_input_r(137 downto 39)   <= data_in(98 downto 0);
                bits_in_buffer               <= 138;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 39;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 104 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(39 downto 0)         <= buf_input_r(103 downto 64);
            if in_rdy = '1' then
                buf_input_r(138 downto 40)   <= data_in(98 downto 0);
                bits_in_buffer               <= 139;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 40;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 105 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(40 downto 0)         <= buf_input_r(104 downto 64);
            if in_rdy = '1' then
                buf_input_r(139 downto 41)   <= data_in(98 downto 0);
                bits_in_buffer               <= 140;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 41;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 106 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(41 downto 0)         <= buf_input_r(105 downto 64);
            if in_rdy = '1' then
                buf_input_r(140 downto 42)   <= data_in(98 downto 0);
                bits_in_buffer               <= 141;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 42;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 107 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(42 downto 0)         <= buf_input_r(106 downto 64);
            if in_rdy = '1' then
                buf_input_r(141 downto 43)   <= data_in(98 downto 0);
                bits_in_buffer               <= 142;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 43;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 108 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(43 downto 0)         <= buf_input_r(107 downto 64);
            if in_rdy = '1' then
                buf_input_r(142 downto 44)   <= data_in(98 downto 0);
                bits_in_buffer               <= 143;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 44;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 109 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(44 downto 0)         <= buf_input_r(108 downto 64);
            if in_rdy = '1' then
                buf_input_r(143 downto 45)   <= data_in(98 downto 0);
                bits_in_buffer               <= 144;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 45;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 110 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(45 downto 0)         <= buf_input_r(109 downto 64);
            if in_rdy = '1' then
                buf_input_r(144 downto 46)   <= data_in(98 downto 0);
                bits_in_buffer               <= 145;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 46;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 111 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(46 downto 0)         <= buf_input_r(110 downto 64);
            if in_rdy = '1' then
                buf_input_r(145 downto 47)   <= data_in(98 downto 0);
                bits_in_buffer               <= 146;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 47;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 112 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(47 downto 0)         <= buf_input_r(111 downto 64);
            if in_rdy = '1' then
                buf_input_r(146 downto 48)   <= data_in(98 downto 0);
                bits_in_buffer               <= 147;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 48;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 113 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(48 downto 0)         <= buf_input_r(112 downto 64);
            if in_rdy = '1' then
                buf_input_r(147 downto 49)   <= data_in(98 downto 0);
                bits_in_buffer               <= 148;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 49;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 114 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(49 downto 0)         <= buf_input_r(113 downto 64);
            if in_rdy = '1' then
                buf_input_r(148 downto 50)   <= data_in(98 downto 0);
                bits_in_buffer               <= 149;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 50;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 115 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(50 downto 0)         <= buf_input_r(114 downto 64);
            if in_rdy = '1' then
                buf_input_r(149 downto 51)   <= data_in(98 downto 0);
                bits_in_buffer               <= 150;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 51;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 116 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(51 downto 0)         <= buf_input_r(115 downto 64);
            if in_rdy = '1' then
                buf_input_r(150 downto 52)   <= data_in(98 downto 0);
                bits_in_buffer               <= 151;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 52;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 117 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(52 downto 0)         <= buf_input_r(116 downto 64);
            if in_rdy = '1' then
                buf_input_r(151 downto 53)   <= data_in(98 downto 0);
                bits_in_buffer               <= 152;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 53;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 118 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(53 downto 0)         <= buf_input_r(117 downto 64);
            if in_rdy = '1' then
                buf_input_r(152 downto 54)   <= data_in(98 downto 0);
                bits_in_buffer               <= 153;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 54;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 119 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(54 downto 0)         <= buf_input_r(118 downto 64);
            if in_rdy = '1' then
                buf_input_r(153 downto 55)   <= data_in(98 downto 0);
                bits_in_buffer               <= 154;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 55;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 120 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(55 downto 0)         <= buf_input_r(119 downto 64);
            if in_rdy = '1' then
                buf_input_r(154 downto 56)   <= data_in(98 downto 0);
                bits_in_buffer               <= 155;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 56;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 121 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(56 downto 0)         <= buf_input_r(120 downto 64);
            if in_rdy = '1' then
                buf_input_r(155 downto 57)   <= data_in(98 downto 0);
                bits_in_buffer               <= 156;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 57;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 122 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(57 downto 0)         <= buf_input_r(121 downto 64);
            if in_rdy = '1' then
                buf_input_r(156 downto 58)   <= data_in(98 downto 0);
                bits_in_buffer               <= 157;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 58;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 123 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(58 downto 0)         <= buf_input_r(122 downto 64);
            if in_rdy = '1' then
                buf_input_r(157 downto 59)   <= data_in(98 downto 0);
                bits_in_buffer               <= 158;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 59;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 124 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(59 downto 0)         <= buf_input_r(123 downto 64);
            if in_rdy = '1' then
                buf_input_r(158 downto 60)   <= data_in(98 downto 0);
                bits_in_buffer               <= 159;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 60;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 125 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(60 downto 0)         <= buf_input_r(124 downto 64);
            if in_rdy = '1' then
                buf_input_r(159 downto 61)   <= data_in(98 downto 0);
                bits_in_buffer               <= 160;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 61;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 126 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(61 downto 0)         <= buf_input_r(125 downto 64);
            if in_rdy = '1' then
                buf_input_r(160 downto 62)   <= data_in(98 downto 0);
                bits_in_buffer               <= 161;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 62;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 127 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(62 downto 0)         <= buf_input_r(126 downto 64);
            if in_rdy = '1' then
                buf_input_r(161 downto 63)   <= data_in(98 downto 0);
                bits_in_buffer               <= 162;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 63;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 128 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(63 downto 0)         <= buf_input_r(127 downto 64);
            if in_rdy = '1' then
                buf_input_r(162 downto 64)   <= data_in(98 downto 0);
                bits_in_buffer               <= 163;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 64;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 129 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(64 downto 0)         <= buf_input_r(128 downto 64);
            if in_rdy = '1' then
                buf_input_r(163 downto 65)   <= data_in(98 downto 0);
                bits_in_buffer               <= 164;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 65;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 130 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(65 downto 0)         <= buf_input_r(129 downto 64);
            if in_rdy = '1' then
                buf_input_r(164 downto 66)   <= data_in(98 downto 0);
                bits_in_buffer               <= 165;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 66;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 131 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(66 downto 0)         <= buf_input_r(130 downto 64);
            if in_rdy = '1' then
                buf_input_r(165 downto 67)   <= data_in(98 downto 0);
                bits_in_buffer               <= 166;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 67;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 132 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(67 downto 0)         <= buf_input_r(131 downto 64);
            if in_rdy = '1' then
                buf_input_r(166 downto 68)   <= data_in(98 downto 0);
                bits_in_buffer               <= 167;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 68;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 133 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(68 downto 0)         <= buf_input_r(132 downto 64);
            if in_rdy = '1' then
                buf_input_r(167 downto 69)   <= data_in(98 downto 0);
                bits_in_buffer               <= 168;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 69;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 134 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(69 downto 0)         <= buf_input_r(133 downto 64);
            if in_rdy = '1' then
                buf_input_r(168 downto 70)   <= data_in(98 downto 0);
                bits_in_buffer               <= 169;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 70;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 135 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(70 downto 0)         <= buf_input_r(134 downto 64);
            if in_rdy = '1' then
                buf_input_r(169 downto 71)   <= data_in(98 downto 0);
                bits_in_buffer               <= 170;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 71;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 136 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(71 downto 0)         <= buf_input_r(135 downto 64);
            if in_rdy = '1' then
                buf_input_r(170 downto 72)   <= data_in(98 downto 0);
                bits_in_buffer               <= 171;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 72;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 137 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(72 downto 0)         <= buf_input_r(136 downto 64);
            if in_rdy = '1' then
                buf_input_r(171 downto 73)   <= data_in(98 downto 0);
                bits_in_buffer               <= 172;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 73;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 138 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(73 downto 0)         <= buf_input_r(137 downto 64);
            if in_rdy = '1' then
                buf_input_r(172 downto 74)   <= data_in(98 downto 0);
                bits_in_buffer               <= 173;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 74;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 139 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(74 downto 0)         <= buf_input_r(138 downto 64);
            if in_rdy = '1' then
                buf_input_r(173 downto 75)   <= data_in(98 downto 0);
                bits_in_buffer               <= 174;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 75;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 140 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(75 downto 0)         <= buf_input_r(139 downto 64);
            if in_rdy = '1' then
                buf_input_r(174 downto 76)   <= data_in(98 downto 0);
                bits_in_buffer               <= 175;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 76;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 141 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(76 downto 0)         <= buf_input_r(140 downto 64);
            if in_rdy = '1' then
                buf_input_r(175 downto 77)   <= data_in(98 downto 0);
                bits_in_buffer               <= 176;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 77;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 142 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(77 downto 0)         <= buf_input_r(141 downto 64);
            if in_rdy = '1' then
                buf_input_r(176 downto 78)   <= data_in(98 downto 0);
                bits_in_buffer               <= 177;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 78;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 143 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(78 downto 0)         <= buf_input_r(142 downto 64);
            if in_rdy = '1' then
                buf_input_r(177 downto 79)   <= data_in(98 downto 0);
                bits_in_buffer               <= 178;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 79;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 144 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(79 downto 0)         <= buf_input_r(143 downto 64);
            if in_rdy = '1' then
                buf_input_r(178 downto 80)   <= data_in(98 downto 0);
                bits_in_buffer               <= 179;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 80;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 145 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(80 downto 0)         <= buf_input_r(144 downto 64);
            if in_rdy = '1' then
                buf_input_r(179 downto 81)   <= data_in(98 downto 0);
                bits_in_buffer               <= 180;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 81;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 146 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(81 downto 0)         <= buf_input_r(145 downto 64);
            if in_rdy = '1' then
                buf_input_r(180 downto 82)   <= data_in(98 downto 0);
                bits_in_buffer               <= 181;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 82;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 147 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(82 downto 0)         <= buf_input_r(146 downto 64);
            if in_rdy = '1' then
                buf_input_r(181 downto 83)   <= data_in(98 downto 0);
                bits_in_buffer               <= 182;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 83;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 148 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(83 downto 0)         <= buf_input_r(147 downto 64);
            if in_rdy = '1' then
                buf_input_r(182 downto 84)   <= data_in(98 downto 0);
                bits_in_buffer               <= 183;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 84;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 149 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(84 downto 0)         <= buf_input_r(148 downto 64);
            if in_rdy = '1' then
                buf_input_r(183 downto 85)   <= data_in(98 downto 0);
                bits_in_buffer               <= 184;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 85;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 150 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(85 downto 0)         <= buf_input_r(149 downto 64);
            if in_rdy = '1' then
                buf_input_r(184 downto 86)   <= data_in(98 downto 0);
                bits_in_buffer               <= 185;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 86;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 151 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(86 downto 0)         <= buf_input_r(150 downto 64);
            if in_rdy = '1' then
                buf_input_r(185 downto 87)   <= data_in(98 downto 0);
                bits_in_buffer               <= 186;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 87;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 152 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(87 downto 0)         <= buf_input_r(151 downto 64);
            if in_rdy = '1' then
                buf_input_r(186 downto 88)   <= data_in(98 downto 0);
                bits_in_buffer               <= 187;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 88;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 153 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(88 downto 0)         <= buf_input_r(152 downto 64);
            if in_rdy = '1' then
                buf_input_r(187 downto 89)   <= data_in(98 downto 0);
                bits_in_buffer               <= 188;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 89;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 154 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(89 downto 0)         <= buf_input_r(153 downto 64);
            if in_rdy = '1' then
                buf_input_r(188 downto 90)   <= data_in(98 downto 0);
                bits_in_buffer               <= 189;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 90;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 155 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(90 downto 0)         <= buf_input_r(154 downto 64);
            if in_rdy = '1' then
                buf_input_r(189 downto 91)   <= data_in(98 downto 0);
                bits_in_buffer               <= 190;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 91;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 156 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(91 downto 0)         <= buf_input_r(155 downto 64);
            if in_rdy = '1' then
                buf_input_r(190 downto 92)   <= data_in(98 downto 0);
                bits_in_buffer               <= 191;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 92;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 157 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(92 downto 0)         <= buf_input_r(156 downto 64);
            if in_rdy = '1' then
                buf_input_r(191 downto 93)   <= data_in(98 downto 0);
                bits_in_buffer               <= 192;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 93;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 158 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(93 downto 0)         <= buf_input_r(157 downto 64);
            if in_rdy = '1' then
                buf_input_r(192 downto 94)   <= data_in(98 downto 0);
                bits_in_buffer               <= 193;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 94;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 159 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(94 downto 0)         <= buf_input_r(158 downto 64);
            if in_rdy = '1' then
                buf_input_r(193 downto 95)   <= data_in(98 downto 0);
                bits_in_buffer               <= 194;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 95;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 160 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(95 downto 0)         <= buf_input_r(159 downto 64);
            if in_rdy = '1' then
                buf_input_r(194 downto 96)   <= data_in(98 downto 0);
                bits_in_buffer               <= 195;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 96;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 161 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(96 downto 0)         <= buf_input_r(160 downto 64);
            if in_rdy = '1' then
                buf_input_r(195 downto 97)   <= data_in(98 downto 0);
                bits_in_buffer               <= 196;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 97;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 162 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(97 downto 0)         <= buf_input_r(161 downto 64);
            if in_rdy = '1' then
                buf_input_r(196 downto 98)   <= data_in(98 downto 0);
                bits_in_buffer               <= 197;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 98;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';
        when 163 =>
            buf_output_r(63 downto 0)        <= buf_input_r(63 downto 0);
            buf_input_r(98 downto 0)         <= buf_input_r(162 downto 64);
            if in_rdy = '1' then
                buf_input_r(197 downto 99)   <= data_in(98 downto 0);
                bits_in_buffer               <= 198;
                congestion_out               <= '1';
            else
                bits_in_buffer               <= 99;
                congestion_out               <= '0';
            end if;
            out_rdy_r                        <= '1';


        -- For this range, the buffer contains to many bits to receieve another input.
        -- That is why the congestion_out was asserted high in the previous range, and set low here.

        when 164 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(99 downto 0)     <= buf_input_r(163 downto 64);
            bits_in_buffer               <= 100;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 165 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(100 downto 0)    <= buf_input_r(164 downto 64);
            bits_in_buffer               <= 101;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 166 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(101 downto 0)    <= buf_input_r(165 downto 64);
            bits_in_buffer               <= 102;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 167 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(102 downto 0)    <= buf_input_r(166 downto 64);
            bits_in_buffer               <= 103;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 168 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(103 downto 0)    <= buf_input_r(167 downto 64);
            bits_in_buffer               <= 104;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 169 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(104 downto 0)    <= buf_input_r(168 downto 64);
            bits_in_buffer               <= 105;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 170 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(105 downto 0)    <= buf_input_r(169 downto 64);
            bits_in_buffer               <= 106;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 171 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(106 downto 0)    <= buf_input_r(170 downto 64);
            bits_in_buffer               <= 107;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 172 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(107 downto 0)    <= buf_input_r(171 downto 64);
            bits_in_buffer               <= 108;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 173 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(108 downto 0)    <= buf_input_r(172 downto 64);
            bits_in_buffer               <= 109;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 174 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(109 downto 0)    <= buf_input_r(173 downto 64);
            bits_in_buffer               <= 110;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 175 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(110 downto 0)    <= buf_input_r(174 downto 64);
            bits_in_buffer               <= 111;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 176 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(111 downto 0)    <= buf_input_r(175 downto 64);
            bits_in_buffer               <= 112;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 177 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(112 downto 0)    <= buf_input_r(176 downto 64);
            bits_in_buffer               <= 113;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 178 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(113 downto 0)    <= buf_input_r(177 downto 64);
            bits_in_buffer               <= 114;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 179 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(114 downto 0)    <= buf_input_r(178 downto 64);
            bits_in_buffer               <= 115;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 180 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(115 downto 0)    <= buf_input_r(179 downto 64);
            bits_in_buffer               <= 116;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 181 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(116 downto 0)    <= buf_input_r(180 downto 64);
            bits_in_buffer               <= 117;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 182 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(117 downto 0)    <= buf_input_r(181 downto 64);
            bits_in_buffer               <= 118;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 183 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(118 downto 0)    <= buf_input_r(182 downto 64);
            bits_in_buffer               <= 119;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 184 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(119 downto 0)    <= buf_input_r(183 downto 64);
            bits_in_buffer               <= 120;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 185 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(120 downto 0)    <= buf_input_r(184 downto 64);
            bits_in_buffer               <= 121;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 186 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(121 downto 0)    <= buf_input_r(185 downto 64);
            bits_in_buffer               <= 122;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 187 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(122 downto 0)    <= buf_input_r(186 downto 64);
            bits_in_buffer               <= 123;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 188 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(123 downto 0)    <= buf_input_r(187 downto 64);
            bits_in_buffer               <= 124;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 189 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(124 downto 0)    <= buf_input_r(188 downto 64);
            bits_in_buffer               <= 125;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 190 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(125 downto 0)    <= buf_input_r(189 downto 64);
            bits_in_buffer               <= 126;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 191 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(126 downto 0)    <= buf_input_r(190 downto 64);
            bits_in_buffer               <= 127;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 192 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(127 downto 0)    <= buf_input_r(191 downto 64);
            bits_in_buffer               <= 128;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 193 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(128 downto 0)    <= buf_input_r(192 downto 64);
            bits_in_buffer               <= 129;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 194 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(129 downto 0)    <= buf_input_r(193 downto 64);
            bits_in_buffer               <= 130;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 195 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(130 downto 0)    <= buf_input_r(194 downto 64);
            bits_in_buffer               <= 131;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 196 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(131 downto 0)    <= buf_input_r(195 downto 64);
            bits_in_buffer               <= 132;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 197 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(132 downto 0)    <= buf_input_r(196 downto 64);
            bits_in_buffer               <= 133;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        when 198 =>
            buf_output_r(63 downto 0)    <= buf_input_r(63 downto 0);
            buf_input_r(133 downto 0)    <= buf_input_r(197 downto 64);
            bits_in_buffer               <= 134;
            congestion_out               <= '1';
            out_rdy_r                    <= '1';
        end case;

        end if;
    end process the_buffing_process;
    end architecture arch_word_compressor_99IN_to_64OUT;