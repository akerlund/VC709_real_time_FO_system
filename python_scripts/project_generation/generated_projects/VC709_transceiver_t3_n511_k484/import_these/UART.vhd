----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2017 12:11:44 PM
-- Design Name: 
-- Module Name: UART - Behavioral
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
--use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART is
    generic (
        baud            : natural := 921600;
        clock_frequency : natural := 100000000
    );
    port (  
        clk         : in  std_logic;
        reset       : in  std_logic;
        
        TX          : out std_logic;
        RX          : in  std_logic;
            
        TX_byte     : in  std_logic_vector(7 downto 0);
        RX_byte     : out std_logic_vector(7 downto 0);
        
        TX_start    : in  std_logic;
        TX_busy     : out std_logic;
        RX_complete : out std_logic        
    );
end UART;

architecture arch_UART of UART is

    -- TX and RX clock counters
    constant BAUD_clock_width : integer := integer(clock_frequency / baud);   
    constant RX_sync_offset   : integer := integer(BAUD_clock_width / 2);
    constant RX_sync_offset2  : integer := BAUD_clock_width + integer(BAUD_clock_width / 2);
    
    signal TX_baud_counter : integer range 0 to BAUD_clock_width := 0;
    signal RX_baud_counter : integer range 0 to RX_sync_offset2 := 0;

    -- States
    type uart_TX_states is ( IDLE, START_BIT, SEND_DATA, STOP_BIT ); 
    type uart_RX_states is ( IDLE, SYNC, RECEIVE, STOP_BIT ); 
    
    signal curr_TX_state : uart_TX_states := IDLE;
    signal curr_RX_state : uart_RX_states := IDLE;
    
    -- Registers
    signal RX_byte_reg : std_logic_vector(7 downto 0);

begin


TX_process: process(clk, reset)
variable bit_count : integer range 0 to 7;
begin
    if reset = '0' then
        TX <= '1';
        TX_baud_counter <= 0;
        bit_count := 0;
        
    elsif rising_edge(clk) then
        case curr_TX_state is

            when IDLE =>
                TX <= '1';
                TX_baud_counter <= 0;
                bit_count := 0;
                
                if TX_start = '1' then
                    curr_TX_state <= START_BIT;
                    TX_busy <= '1';
                else
                    TX_busy <= '0';
                end if;
                
            when START_BIT =>
                TX <= '0';
                
                if TX_baud_counter = BAUD_clock_width then
                    curr_TX_state <= SEND_DATA;
                    TX_baud_counter <= 0;
                else
                    TX_baud_counter <= TX_baud_counter + 1;
                end if;
                
            when SEND_DATA =>
                TX <= TX_byte(bit_count);
                
                if TX_baud_counter = BAUD_clock_width then
                    TX_baud_counter <= 0;
                    
                    if bit_count = 7 then
                        curr_TX_state <= STOP_BIT;
                        bit_count := 0;
                    else
                        bit_count := bit_count + 1;
                    end if;
                else
                    TX_baud_counter <= TX_baud_counter + 1;
                end if;
                
            when STOP_BIT =>
                TX <= '1';
                
                if TX_baud_counter = BAUD_clock_width then
                    curr_TX_state <= IDLE;
                    TX_baud_counter <= 0;
                else
                    TX_baud_counter <= TX_baud_counter + 1;
                end if;
                
        end case;
    end if;
end process;

    
RX_process: process(clk, reset, RX_byte_reg)
variable bit_count : integer range 0 to 7;
begin

    RX_byte <= RX_byte_reg;

    if reset = '0' then
        RX_complete <= '0';
        RX_baud_counter <= 0;
        RX_byte <= (others => '0');
        RX_byte_reg <= (others => '0');
        bit_count := 0;
        
    elsif rising_edge(clk) then
        case curr_RX_state is

            when IDLE =>
                RX_complete <= '0';
                RX_baud_counter <= 0;
                bit_count := 0;
                
                if RX = '0' then
                    curr_RX_state <= SYNC;
                end if;
                
            when SYNC =>
                if RX_baud_counter = RX_sync_offset then
                    curr_RX_state <= RECEIVE;
                    RX_baud_counter <= 0;
                else
                    RX_baud_counter <= RX_baud_counter + 1;
                end if;
                
            when RECEIVE =>
                if RX_baud_counter = BAUD_clock_width then
                
                    RX_byte_reg(bit_count) <= RX;
                    RX_baud_counter <= 0;
                    
                    if bit_count = 7 then
                        RX_complete <= '1';
                        curr_RX_state <= STOP_BIT;
                        bit_count := 0;
                    else
                        bit_count := bit_count + 1;
                    end if;
                else
                    RX_baud_counter <= RX_baud_counter + 1;
                end if;
                
            when STOP_BIT =>
                if RX_baud_counter = RX_sync_offset2 then
                    curr_RX_state <= IDLE;
                    RX_baud_counter <= 0;
                else
                    RX_baud_counter <= RX_baud_counter + 1;
                end if;
                
                                
        end case;
    end if;
end process;

end arch_UART;
