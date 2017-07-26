# Just to generate some strings for the testbench.

INPUT_WIDTH  = 64
OUTPUT_WIDTHS = [255,512,1023,113,127,247,502,1013,239,493,1003]

list.sort(OUTPUT_WIDTHS)

for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--component word_expander_"+str(INPUT_WIDTH)+"IN_to_"+str(OUTPUT_WIDTH)+"OUT")



for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--use work.word_expander_package_for_D"+str(INPUT_WIDTH)+"_N"+str(OUTPUT_WIDTH)+".all;")



for OUTPUT_WIDTH in OUTPUT_WIDTHS:

	comps = "    component word_expander_"+str(INPUT_WIDTH)+"IN_to_"+str(OUTPUT_WIDTH)+"OUT is"
	comps += """
    generic
    (
        IN_WIDTH  : integer := """ + str(INPUT_WIDTH) + ";"
	comps += "\n        OUT_WIDTH : integer := " + str(OUTPUT_WIDTH)

	comps += """
    );
    port(
        user_clk  : in  std_logic;
        reset_in  : in  std_logic;
        enable_in : in  std_logic;

        in_rdy    : in  std_logic;
        data_in   : in  std_logic_vector(IN_WIDTH-1 downto 0);

        buf_out   : out std_logic_vector(OUT_WIDTH-1 downto 0);
        out_rdy   : out std_logic
    );
"""
	comps += "    end component;\n"

	print(comps)

for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--OUT_WIDTH  : integer := " + str(OUTPUT_WIDTH))


for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--CURRENT_ROM <= ROM_D64_N" + str(OUTPUT_WIDTH) + "(out_cnt);")

for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--if buf_out_i /= ROM_D" + str(INPUT_WIDTH) + "_N" + str(OUTPUT_WIDTH) + "(out_cnt) then")

