----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: 03/24/2017 04:13:47 PM
-- Design Name: 
-- Module Name: data_generator - arch_data_generator
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_generator is
    generic
    (
        DATA_WIDTH : integer := 32;
        ROM_SIZE   : integer := 16
    );
    port (
        tx_clk   : in  std_logic;       
        reset_in : in  std_logic;

        enable_in  : in  std_logic;
        enable_out : out std_logic;
        
        data_out : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end data_generator;

architecture arch_data_generator of data_generator is
                
    signal rom_cnt : integer range 0 to 15;

    signal data_out_r : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal enable_r   : std_logic;

begin

output_reg_process:
process(reset_in, tx_clk, enable_in)
begin
    if reset_in = '0' then
        data_out <= (others=>'0');
        enable_out   <= '0';
    elsif rising_edge(tx_clk) and enable_in = '1' then
        data_out   <= data_out_r;
        enable_out <= enable_r;
    end if;
end process;

rom_process:
process(reset_in, tx_clk, enable_in)
begin
    if reset_in = '0' then
        data_out_r <= (others=>'0');
        rom_cnt    <= 0;
        enable_r   <= '0';
    elsif rising_edge(tx_clk) and enable_in = '1' then
        enable_r <= '1';
        if rom_cnt /= ROM_SIZE-1 then
            rom_cnt <= rom_cnt + 1;
        else
            rom_cnt <= 0;
        end if;
        data_out_r <= TX_reference_data(rom_cnt);
    end if;
end process rom_process;
end arch_data_generator;