----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 04/11/2017 10:48:05 PM
-- Design Name: 
-- Module Name: RX_syncronizer - arch_RX_syncronizer
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
use work.reference_data_package.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RX_syncronizer is
    generic(
        IN_WIDTH : integer := 64
    );
    port(
        rx_clk        : in  std_logic;
        reset_in      : in  std_logic;
        block_lock    : in  std_logic;
        rx_data_in    : in  std_logic_vector((IN_WIDTH-1) downto 0);
        ref_cnt_out   : out std_logic_vector(7 downto 0);        
        
        rx_synced_out : out std_logic
    );
end RX_syncronizer;

architecture arch_RX_syncronizer of RX_syncronizer is

    type sync_states is (IDLE, WAIT_FOR_NOT_BLOCK_LOCK, WAIT_FOR_SYNC_DATA, SYNCRONIZED);
    signal SYNC_STATE : sync_states;
    
    signal SYNC_ref_cnt : unsigned(7 downto 0);-- range 0 to 255;

begin

rx_sync_process:
process(rx_clk, reset_in)
begin

    if reset_in = '0' then
    
        SYNC_STATE     <= IDLE;
        SYNC_ref_cnt   <= (others=>'0');
        rx_synced_out  <= '0';
        ref_cnt_out    <= (others=>'0');
    
    elsif rising_edge(rx_clk) then
    
    
        ref_cnt_out <= std_logic_vector(SYNC_ref_cnt);
    
        case SYNC_STATE is
        
            when IDLE =>

                SYNC_STATE   <= WAIT_FOR_NOT_BLOCK_LOCK;


            when WAIT_FOR_NOT_BLOCK_LOCK =>

                if block_lock = '1' then
                    SYNC_STATE <= WAIT_FOR_SYNC_DATA;
                end if;

            when WAIT_FOR_SYNC_DATA =>

                if rx_data_in = x"AAAAAAAAAAAAAAAA" then
                    SYNC_ref_cnt <= SYNC_ref_cnt + 1;
                    if SYNC_ref_cnt = 7 then
                        SYNC_STATE   <= SYNCRONIZED;
                        rx_synced_out  <= '1';
                    end if;
                end if;        

            when SYNCRONIZED =>

                    rx_synced_out  <= '1';

        end case;

    end if;
    
end process;

end arch_RX_syncronizer;
