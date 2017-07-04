----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2017 04:47:09 PM
-- Design Name: 
-- Module Name: BER_calculator - arch_BER_calculator
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

entity BER_calculator is
    generic
    (
        DATA_WIDTH : integer := 64
    );
    port (
        rx_clk           : in  std_logic;       
        reset_in         : in  std_logic;     
        halt_in          : in  std_logic; 
        --enable_in        : in  std_logic;

        in_rdy           : in  std_logic;
        received_data_in : in  std_logic_vector((DATA_WIDTH-1) downto 0);
        
        out_rdy          : out std_logic;
        errors_out       : out std_logic_vector(15 downto 0)
    );
end BER_calculator;
    
architecture arch_BER_calculator of BER_calculator is
--------------------------------------------------------------------------------

    component BER_circuit_64_bit_input is
    generic
    (
        IN_WIDTH  : integer
    );
    port
    (
        user_clk : in  std_logic;       
        reset_in : in  std_logic; 
    
        in_rdy   : in  std_logic;
        out_rdy  : out std_logic;
    
        data_in  : in  std_logic_vector;
        ref_in   : in  std_logic_vector;
        
        errors   : out std_logic_vector(15 downto 0)
        
    );
    end component;
    
    signal BER_circuit_reset_in_i : std_logic;
    signal BER_circuit_in_rdy_i   : std_logic;
    signal BER_circuit_out_rdy_i  : std_logic;
    
    signal BER_circuit_data_in_i  : std_logic_vector((DATA_WIDTH-1) downto 0);
    signal BER_circuit_ref_in_i   : std_logic_vector((DATA_WIDTH-1) downto 0);

    --attribute keep : string;
    --attribute keep of BER_circuit_ref_in_i : signal is "true";
            
    signal BER_circuit_errors_i   : std_logic_vector(15 downto 0);
    
    signal ROM_ref_cnt : integer range 0 to (ROM_ROWS-1);
    
begin

    out_rdy    <= BER_circuit_out_rdy_i;
    errors_out <= BER_circuit_errors_i;
    
BER_circuit_64_bit_input_comp_0:
component BER_circuit_64_bit_input
    generic map(
        IN_WIDTH => DATA_WIDTH
    )
    port map(
        user_clk => rx_clk,
        reset_in => BER_circuit_reset_in_i,
    
        in_rdy   => BER_circuit_in_rdy_i,        
        out_rdy  => BER_circuit_out_rdy_i,
    
        data_in  => BER_circuit_data_in_i,
        ref_in   => BER_circuit_ref_in_i,
        
        errors   => BER_circuit_errors_i
        
    );
    
reference_data_process:
process(rx_clk, reset_in)
begin
    if reset_in = '0' then
        BER_circuit_reset_in_i <= '0';
        BER_circuit_in_rdy_i   <= '0';
        BER_circuit_data_in_i  <= (others=>'0');
        BER_circuit_ref_in_i   <= (others=>'0');
        ROM_ref_cnt            <= 0;
    elsif rising_edge(rx_clk) then--and enable_in = '1' then
            
        if halt_in = '1' then
            ROM_ref_cnt <= 1;
            BER_circuit_reset_in_i <= '0';
        elsif in_rdy = '1' then
 
            BER_circuit_reset_in_i <= '1';
            BER_circuit_in_rdy_i  <= '1';
            BER_circuit_data_in_i <= received_data_in;
            
            BER_circuit_ref_in_i <= RX_reference_data(ROM_ref_cnt);
            
            if ROM_ref_cnt /= (ROM_ROWS-1) then
                ROM_ref_cnt <= ROM_ref_cnt + 1;
            else
                --BER_circuit_ref_in_i <= RX_reference_data(0);
                ROM_ref_cnt <= 0;
            end if;
        else
            BER_circuit_reset_in_i <= '1';
            BER_circuit_in_rdy_i <= '0';
            BER_circuit_ref_in_i <= RX_reference_data(ROM_ref_cnt);
        end if;
    end if;

end process;
    
end arch_BER_calculator;
