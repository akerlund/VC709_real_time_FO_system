----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2017 12:24:18 PM
-- Design Name: 
-- Module Name: fc_data_comparator - arch_fc_data_comparator
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

entity fc_data_comparator is
    port (
        clk_in         : in  std_logic;
        reset_in       : in  std_logic;
        tx_data_in     : in  std_logic_vector(63 downto 0);
        tx_data_in_rdy : in  std_logic;
        rx_data_in     : in  std_logic_vector(63 downto 0);
        rx_data_in_rdy : in  std_logic;
        BER_out        : out std_logic_vector(31 downto 0);
        BER_out_rdy    : out std_logic
    );
end fc_data_comparator;

architecture arch_fc_data_comparator of fc_data_comparator is

begin

main_process:
process(reset_in, clk_in)


end arch_fc_data_comparator;
