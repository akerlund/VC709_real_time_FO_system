----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 04/11/2017 10:48:05 PM
-- Design Name: 
-- Module Name: GTHE2_SIM - arch_GTHE2_SIM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GTHE2_SIM is
    generic(
        IN_WIDTH : integer := 32
    );
    port(
         user_clk            : in  std_logic;
         reset_in            : in  std_logic;
           
         tx_data             : in  std_logic_vector((IN_WIDTH-1) downto 0);
         tx_seq_in           : in  std_logic_vector(6 downto 0);
         tx_header_in        : in  std_logic_vector(1 downto 0);
         tx_valid_in         : in  std_logic;
           
         rx_valid_out        : out std_logic;
         rx_header_out       : out std_logic_vector(1 downto 0);
           
         rx_header_valid_out : out std_logic;
         rx_data             : out std_logic_vector((IN_WIDTH-1) downto 0)
     );           
end GTHE2_SIM;

architecture arch_GTHE2_SIM of GTHE2_SIM is

    signal tx_data_r      : std_logic_vector((IN_WIDTH-1) downto 0);
    signal tx_seq_in_r    : std_logic_vector(6 downto 0);
    signal tx_header_in_r : std_logic_vector(1 downto 0);

    signal rx_valid_out_r        : std_logic;
    signal rx_valid_out_r0       : std_logic;
    
    signal rx_header_out_r       : std_logic_vector(1 downto 0);

    signal rx_header_valid_out_r  : std_logic;
    signal rx_header_valid_out_r0 : std_logic;
    signal rx_data_r              : std_logic_vector((IN_WIDTH-1) downto 0);
 

begin

    rx_valid_out        <= rx_valid_out_r0;
    rx_header_out       <= rx_header_out_r;
    rx_header_valid_out <= rx_header_valid_out_r0;
    rx_data             <= rx_data_r;

    
GTHE_process:
process(reset_in, user_clk)
variable cnt : integer := 0;
begin    
    if reset_in = '0' then
    
        tx_data_r      <= (others=> '0');
        tx_seq_in_r    <= (others=> '0');
        tx_header_in_r <= (others=> '0');
        
        
        rx_data_r       <= (others=> '0');
        rx_header_out_r <= (others=> '0');
        rx_header_valid_out_r  <= '0';
        rx_header_valid_out_r0 <= '0';
        rx_valid_out_r <= '0';
        
                
        rx_valid_out_r  <= '0';   
        rx_valid_out_r0 <= '0';     
    
    elsif rising_edge(user_clk) then


        cnt := cnt + 1;


        tx_data_r      <= tx_data;
        rx_data_r      <= tx_data_r;


        tx_seq_in_r    <= tx_seq_in;
        tx_header_in_r <= tx_header_in;
        if cnt > 1000 then
            rx_header_out_r <= "00";
        else
            rx_header_out_r <= tx_header_in_r;
        end if;
        rx_header_out_r <= tx_header_in_r;


        rx_valid_out_r <= tx_valid_in;
        --rx_valid_out_r0 <= rx_header_valid_out_r;
        rx_valid_out_r0 <= rx_valid_out_r;


        if (tx_header_in_r = "01") or (tx_header_in_r = "10") then
            if cnt > 1000 then
                rx_header_valid_out_r <= '0';
            else
                rx_header_valid_out_r <= '1';
            end if;
        else 
            rx_header_valid_out_r <= '0';
        end if;


        rx_header_valid_out_r0 <= rx_header_valid_out_r;


    end if;
end process;
end arch_GTHE2_SIM;
