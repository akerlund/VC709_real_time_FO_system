IN_WIDTH = 64
OUT_WIDTH = 113

ENTITYNAME = "word_expander_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT"
FILENAME = "word_expander_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT.vhd"

import time
localtime = time.asctime( time.localtime(time.time()) )
tab2 = "        "
tab3 = "            "
tab4 = "                "
tab5 = "                    "
tab6 = "                        "


body = ''

body += """----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: """
body += localtime + "\n"
body += """
-- Design Name: 
-- Module Name: """
body +=  ENTITYNAME + " - arch_" + ENTITYNAME

body += """
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
"""
body += "entity " + ENTITYNAME + " is\n" 
body += """
generic
(
    IN_WIDTH  : integer := """ + str(IN_WIDTH) + ";\n"

body += """
    OUT_WIDTH : integer := """ + str(OUT_WIDTH) + "\n"
body += """
);
port(
    user_clk   : in  std_logic;       
    reset_in   : in  std_logic;
    enable_in  : in  std_logic;

    in_rdy     : in  std_logic;
    data_in    : in  std_logic_vector(IN_WIDTH-1 downto 0);

    buf_out    : out std_logic_vector(OUT_WIDTH-1    downto 0);
    out_rdy    : out std_logic

    );
"""    
body += "end " + ENTITYNAME + ";\n";
body += "architecture arch_" + ENTITYNAME + " of " + ENTITYNAME + " is\n"


body += """
    constant BUF_WIDTH : integer := (OUT_WIDTH + IN_WIDTH);

    signal buf_input_r  : std_logic_vector(BUF_WIDTH-1 downto 0);
    signal buf_output_r : std_logic_vector(OUT_WIDTH-1 downto 0);
    signal out_rdy_r    : std_logic;

    signal bits_in_buffer : integer range 0 to BUF_WIDTH;

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
process(reset_in, user_clk, in_rdy, enable_in)
begin
    if reset_in = '0' then

        buf_input_r  <= (others=>'0');
        buf_output_r <= (others=>'0');

        bits_in_buffer <= 0;

        out_rdy_r <= '0';

    elsif rising_edge(user_clk) and enable_in = '1' then
"""

body += tab2 + "if in_rdy = '1' then\n"
body += tab3 + "if bits_in_buffer >= " + str(OUT_WIDTH - IN_WIDTH) + " then\n" 
body += tab4 + "out_rdy_r <= '1';\n"
body += tab4 + "case bits_in_buffer is\n"

# Starts with the base case.
min_bits = OUT_WIDTH - IN_WIDTH
body += tab5 + "when " + str(min_bits) + " =>\n"
body += tab6 + ("buf_output_r(" + str(min_bits-1) + " downto 0)").ljust(28) + " <= buf_input_r(" + str(min_bits-1) + " downto 0);\n"
body += tab6 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto " + str(min_bits) + ")").ljust(28) + " <= data_in(" + str(OUT_WIDTH-min_bits-1) + " downto 0);\n"
body += tab6 + ("buf_input_r").ljust(28) + " <= (others=>'0');\n"
body += tab6 + "bits_in_buffer".ljust(28) + " <= 0;\n"


for i in range(OUT_WIDTH - IN_WIDTH + 1, OUT_WIDTH):

    body += tab5 + "when " + str(i) + " =>\n"
    body += tab6 + ("buf_output_r(" + str(i-1) + " downto 0)").ljust(28) + " <= buf_input_r(" + str(i-1) + " downto 0);\n"
    body += tab6 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto " + str(i) + ")").ljust(28) + " <= data_in(" + str(OUT_WIDTH-i-1) + " downto 0);\n"
    body += tab6 + ("buf_input_r (" + str(i + IN_WIDTH - OUT_WIDTH - 1) + " downto 0)").ljust(28) + \
                    " <= " + "data_in(" + str(IN_WIDTH - 1) + " downto " + str(OUT_WIDTH-i) + ");\n"
    body += tab6 + "bits_in_buffer".ljust(28) + " <= " + str(i + IN_WIDTH - OUT_WIDTH ) + ";\n"
body += tab5 + "when others =>\n"   


body += tab4 + "end case;\n"
body += tab3 + "else\n"
body += tab4 + "out_rdy_r <= '0';\n"
body += tab4 + "case bits_in_buffer is\n"


for i in range(0, OUT_WIDTH - IN_WIDTH):

    body += tab5 + "when " + str(i) + " =>\n"
    body += tab6 + ("buf_input_r (" + str(i + IN_WIDTH - 1) + " downto " + str(i) + ")").ljust(28) + \
                    " <= " + "data_in(" + str(IN_WIDTH - 1) + " downto 0);\n"
    body += tab6 + "bits_in_buffer".ljust(28) + " <= " + str(i + IN_WIDTH) + ";\n"
body += tab5 + "when others =>\n"   

body += tab4 + "end case;\n"



body += tab3 + "end if;\n"

body += tab2 + "else\n" + tab4 + "out_rdy_r <= '0';\n"

body += tab2 + "end if;\n"

body += "    end if;\n"
body += "end process;\n"
body += "end arch_" + ENTITYNAME + ";"

#print(body)

with open(FILENAME,'w') as file:
    file.write(body)