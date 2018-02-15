""" Just to generate some strings for the testbench. I was testing
	all of these in the same test bench and so I made this to
	print out all declarations and then I just copied and pasted them
	into that file.
"""
INPUT_WIDTH  = 64
OUTPUT_WIDTHS = [127,255,511,120,247,502,113,239,493,106,231,484,99,223,475]

list.sort(OUTPUT_WIDTHS)

for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--component word_compressor_"+str(OUTPUT_WIDTH)+"IN_to_64OUT_ver2")



for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--use work.word_expander_package_for_D64_N"+str(OUTPUT_WIDTH)+".all;")



for OUTPUT_WIDTH in OUTPUT_WIDTHS:

	comps = "--    component word_compressor_"+str(OUTPUT_WIDTH)+"IN_to_64OUT_ver2 is"
	comps += """
	--    port(
	--        clk_in       : in  std_logic;       
	--        reset_in       : in  std_logic;
	--        enable_in      : in  std_logic;

	--        data_in        : in  std_logic_vector("""
	comps += str(OUTPUT_WIDTH-1) + " downto 0);"
	comps += """
	--        data_in_rdy    : in  std_logic;

	--        data_out       : out std_logic_vector(63 downto 0);
	--        data_out_rdy   : out std_logic;
	--        input_full     : out std_logic
	--    );
	--    end component;
	"""
	print(comps)




for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("--IN_WIDTH  : integer := " + str(OUTPUT_WIDTH))


for OUTPUT_WIDTH in OUTPUT_WIDTHS:
	print("data_in_i <= ROM_D64_N" + str(OUTPUT_WIDTH) + "(in_cnt);")