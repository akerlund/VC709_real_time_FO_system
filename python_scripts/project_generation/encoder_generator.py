#!/usr/bin/env python2
# -*- coding: utf-8 -*-

def enc_generator(k,n):

	body = """library ieee;
use ieee.std_logic_1164.all;
entity synenc_reg is
    port(
"""
	body += "        in_data      : in  std_logic_vector(" + str(k-1) + " downto 0);\n"
	body += "        out_data     : out std_logic_vector(" + str(n-1) + " downto 0);\n"
	body += "        clk          : in  std_logic;\n"
	body += "        ena          : in  std_logic;\n"
	body += "        error_inject : in  std_logic_vector(1 downto 0)\n"
	body += "    );\n"
	body += "end entity;\n\n"

	body += "architecture arch of synenc_reg is\n\n"
	body += "    signal  in_data_reg  : std_logic_vector(" + str(k-1) + " downto 0);\n"
	body += "    signal  out_data_sig : std_logic_vector(" + str(n-1) + " downto 0);\n\n"

	body += "begin\n"
	body += """
    enc :   entity work.synenc
    port map(
        in_data => in_data,
        out_data => out_data_sig
    );

    process(clk)
    begin
        if rising_edge(clk) and ena = '1' then

            in_data_reg <= in_data;

            if error_inject = "01" then
"""
	body += "            	out_data(" + str(n-1) + " downto 1) <= out_data_sig(" + str(n-1) + " downto 1);\n"
	body += "            	out_data(0) <= not out_data_sig(0);\n"
	body += "            elsif error_inject = \"10\" then\n"
	body += "            	out_data(" + str(n-1) + " downto 2) <= out_data_sig(" + str(n-1) + " downto 2);\n"
	body += "            	out_data(1 downto 0) <= not out_data_sig(1 downto 0);\n"
	body += "            elsif error_inject = \"11\" then\n"
	body += "            	out_data(" + str(n-1) + " downto 3) <= out_data_sig(" + str(n-1) + " downto 3);\n"
	body += "            	out_data(2 downto 0) <= not out_data_sig(2 downto 0);\n"

	body += "            else\n"
	body += "                out_data <= out_data_sig;\n"
	body += "            end if;\n"



	body += """
        end if;
    end process;
end arch;"""

	return body

#enc_generator(115,112)