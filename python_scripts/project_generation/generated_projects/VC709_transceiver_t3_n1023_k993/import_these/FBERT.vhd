----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 04/05/2017 06:34:09 PM
-- Design Name: 
-- Module Name: FBERT - arch_FBERT
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FBERT is
generic
(
    IN_WIDTH : integer := 32;
    START_WORD : std_logic_vector(63 downto 0)
);
port
(
    rx_clk          : in  std_logic;       
    reset_in        : in  std_logic;
    block_sync_in   : in  std_logic;

    time_interval   : in  std_logic_vector(31 downto 0); -- 2**32 = 4294967296
   
    rx_data_in      : in  std_logic_vector((IN_WIDTH-1) downto 0);
    rx_in_rdy       : in  std_logic;
    
    BER_data_in     : in  std_logic_vector(15 downto 0);
    BER_in_rdy      : in  std_logic;
    BER_halt_out    : out std_logic;
    
    start_run       : in  std_logic;
    run_rdy         : out std_logic;
    BER_out         : out std_logic_vector(31 downto 0);
    state_out       : out std_logic_vector(2 downto 0)
);
end FBERT;  

architecture arch_FBERT of FBERT is

    constant START_W : std_logic_vector((IN_WIDTH-1) downto 0) := START_WORD;

    signal total_errors_detected : unsigned(31 downto 0);
    
    type   FBERT_STATE_TYPE is (IDLE, SYNC_RX, RX_SYNCED, SYNC_BER_CALCULATOR, FBERT_RUN, FBERT_END);
    signal FBERT_STATE : FBERT_STATE_TYPE;
    
    signal clock_cnt : unsigned(31 downto 0);
    signal clock_max : unsigned(31 downto 0);
    
begin

FBERT_process:
process(rx_clk, reset_in)
begin

    if reset_in = '0' then
        state_out <= "111";
        FBERT_STATE           <= IDLE;
        total_errors_detected <= (others=>'0');
        clock_cnt             <= (others=>'0');
        clock_max             <= (others=>'0');
        
        BER_halt_out <= '0';
        run_rdy      <= '0';
        BER_out      <= (others=>'0');

    elsif rising_edge(rx_clk) then

        case FBERT_STATE is

            when IDLE =>
            
                state_out <= "001";
                FBERT_STATE <= SYNC_RX;

            when SYNC_RX =>
            
                state_out <= "010";
                if block_sync_in = '1' then
                    FBERT_STATE <= RX_SYNCED;
                end if;

            when RX_SYNCED =>
            
                state_out <= "011";
                if block_sync_in = '0' then
                    FBERT_STATE <= SYNC_RX;
                elsif start_run = '1' then
                    FBERT_STATE <= SYNC_BER_CALCULATOR;
                    clock_cnt <= (others=>'0');
                    clock_max <= unsigned(time_interval);
                end if;

            when SYNC_BER_CALCULATOR =>

                state_out <= "100";
                clock_cnt <= (others=>'0');
                clock_max <= unsigned(time_interval);

                if rx_in_rdy = '1' and (rx_data_in = START_W) then
                    BER_halt_out <= '0';
                    FBERT_STATE  <= FBERT_RUN;
                else
                    BER_halt_out <= '1';
                end if;
                
            when FBERT_RUN =>
            
                state_out <= "101";
                if BER_in_rdy = '1' then
                    total_errors_detected <= total_errors_detected + unsigned("0000000000000000" & BER_data_in);
                
                    clock_cnt <= clock_cnt + 1;
                    
                    if clock_cnt = clock_max then
                        FBERT_STATE <= FBERT_END;
                        BER_out     <= std_logic_vector(total_errors_detected);
                        run_rdy     <= '1';
                    end if;
                end if;
                
            when FBERT_END =>
            
                state_out <= "110";
                FBERT_STATE <= SYNC_BER_CALCULATOR;
                total_errors_detected <= (others=>'0');
                run_rdy     <= '0';
                
        end case;
    
    end if;
    
end process FBERT_process;
end arch_FBERT;
