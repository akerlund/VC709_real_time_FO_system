def gen_compressor_tb(IN_WIDTH, OUT_WIDTH):

	ENTITY_NAME = "word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT_tb1"

	body = """----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2017 06:22:35 PM
-- Design Name: 
-- Module Name: word_compressors_tb1_tb1 - arch_word_compressors_tb1_tb1
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
"""

	body += "use work.word_expander_package_for_D" + str(OUT_WIDTH) + "_N" + str(IN_WIDTH) + ".all;\n"



	body += """
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity """
	body += ENTITY_NAME + " is\n"
	body += """
    generic
    (
"""
	body += "        OUT_WIDTH : integer := " + str(OUT_WIDTH) + ";\n"
	body += "        IN_WIDTH  : integer := " + str(IN_WIDTH) + "\n"
	body += """
    );
end """

	body += ENTITY_NAME +";\n"

	body += """
architecture """

	body += "	arch_" + ENTITY_NAME + " of " + ENTITY_NAME + " is\n"

	body += """
    -- Inputs
    signal   sim_clk    : std_logic;
    signal   reset_in   : std_logic;
    constant clk_period : time := 100 ns;

"""    

	body += "    component word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT is\n"

	body += """
        port(
            clk_in       : in  std_logic;       
            reset_in       : in  std_logic;
            enable_in      : in  std_logic;
"""    
	body += "            data_in        : in  std_logic_vector(IN_WIDTH-1 downto 0);\n"

	body += "            data_in_rdy    : in  std_logic;\n"
    
	body += "            data_out       : out std_logic_vector(OUT_WIDTH-1 downto 0);\n"

	body += """
            data_out_rdy   : out std_logic;
            input_full     : out std_logic
        );
        end component;

    
    signal enable_in_i      : std_logic;
    signal congestion_out_i : std_logic;

    signal data_in_i        : std_logic_vector(IN_WIDTH-1 downto 0);
    signal in_rdy_i         : std_logic;

    signal buf_out_i        : std_logic_vector(OUT_WIDTH-1 downto 0);
    signal out_rdy_i        : std_logic;
    
    signal WRONG_OUTPUT     : std_logic := '0';
    signal WRONG_OUTPUT_r   : std_logic := '0';
    signal TEST_DONE        : std_logic := '0';
    signal CURRENT_ROM      : std_logic_vector(OUT_WIDTH-1 downto 0);
    signal nr_of_runs_cnt   : integer := 0;

begin

word_compressor_comp:
""" 
	body += "component word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT\n"

	body += """
    port map(
        clk_in       => sim_clk,
        reset_in     => reset_in,

        enable_in    => enable_in_i,

        data_in      => data_in_i,
        data_in_rdy  => in_rdy_i,
    
        data_out     => buf_out_i,
        data_out_rdy => out_rdy_i,
        
        input_full   => congestion_out_i
    );

    
-- Clock process.
rx_clk_process:
process
begin
    sim_clk <= '1';
    wait for clk_period/2;
    sim_clk <= '0';
    wait for clk_period/2;
end process;


-- Stimulus process
stim_proc:
process
begin

    reset_in    <= '0';
    enable_in_i <= '0';
    
    wait for 10*clk_period;

    reset_in <= '1';
    
    wait for clk_period;
     
    enable_in_i <= '1';
        
    wait for 100 us;
    
    enable_in_i <= '0';
    
    wait for 10 us;
    
    enable_in_i <= '1';
    
    
    wait for 999 Ms;
    
    assert false report "End of simulation" severity FAILURE;

end process;


data_in_process:
process
variable in_cnt : integer := 0;
variable in_rdy_cnt : integer := 0;
begin

"""




	body += "    data_in_i   <= ROM_D" + str(OUT_WIDTH) + "_N" + str(IN_WIDTH) + "(in_cnt);\n\n"

	body += "    in_rdy_cnt := in_rdy_cnt + 1;\n\n"

	   

	body += "    if reset_in = '1' and enable_in_i = '1' and congestion_out_i = '0' then\n\n"
	body += "        in_rdy_i  <= '1';\n"

	    
	body += "        data_in_i <= ROM_D" + str(OUT_WIDTH) + "_N" + str(IN_WIDTH) + "(in_cnt);\n"

	body += """
        if in_cnt /= (INPUT_WIDTH*INPUT_ROM_ROWS-1) then
            in_cnt := in_cnt + 1;
        else
            in_cnt := 0;
            TEST_DONE <= '1';
            nr_of_runs_cnt <= nr_of_runs_cnt + 1;
            if nr_of_runs_cnt = 32 then
                if WRONG_OUTPUT_r = '0' then
                    assert false report "TEST DONE: SUCCESSFUL" severity FAILURE;
                else
                    assert false report "TEST DONE: FAILURE" severity FAILURE;
                end if;
            end if;
        end if;
    else
        in_rdy_i  <= '0';
"""
	body += "        data_in_i <= ROM_D" + str(OUT_WIDTH) + "_N" + str(IN_WIDTH) + "(in_cnt);\n"
	body += """
    end if;  
    wait for clk_period;

end process;


data_check_process:
process
variable out_cnt : integer := 0;
begin

    CURRENT_ROM <= ROM_send_data(out_cnt);
    wait for clk_period;

    if out_rdy_i = '1' and enable_in_i = '1' then
    
        if buf_out_i /= ROM_send_data(out_cnt) then
            WRONG_OUTPUT   <= '1';
            WRONG_OUTPUT_r <= '1';
        else
            WRONG_OUTPUT <= '0';
        end if;
        
        if out_cnt /= (INPUT_ROM_ROWS-1) then
            out_cnt := out_cnt + 1;
        else
            out_cnt := 0;
        end if;
        
        
    end if;
end process;
"""
	body += "end arch_" + ENTITY_NAME + ";"

	return body