#!/usr/bin/env python2
# -*- coding: utf-8 -*-

""" This is the script which generates the enormous compressors.
    So large they won't fit the FPGA, except the small ones.
"""

#IN_WIDTH = 239
OUT_WIDTH = 113

#IN_WIDTHS = [127,255,511,120,247,502,113,239,493,106,231,484,99,223,475]
IN_WIDTHS = [512]

for IN_WIDTH in IN_WIDTHS:

    ENTITYNAME = "word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT"
    FILENAME = "word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT.vhd"

    # This will set unused bits to 'X' to visualize in simulation
    DEBUG = False

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
    -- use IEEE.NUMERIC_STD.ALL;

    -- Uncomment the following library declaration if instantiating
    -- any Xilinx leaf cells in this code.
    --library UNISIM;
    --use UNISIM.VComponents.all;
    """
    body += "entity " + ENTITYNAME + " is\n"
    body += """
    port(
        user_clk       : in  std_logic;       
        reset_in       : in  std_logic;

        enable_in      : in  std_logic;
        congestion_out : out std_logic;

"""


    body += "        data_in        : in  std_logic_vector(" + str(IN_WIDTH-1) + " downto 0);\n"
    body += "        in_rdy         : in  std_logic;\n\n"
        
    body += "        buf_out        : out std_logic_vector(" + str(OUT_WIDTH-1) + " downto 0);\n"
    body += """        out_rdy        : out std_logic

    );
    """    
    body += "end " + ENTITYNAME + ";\n\n";
    body += "architecture arch_" + ENTITYNAME + " of " + ENTITYNAME + " is\n\n"

    BUFFER_SIZE = 2*IN_WIDTH

    body += "    -- Input registers.\n"
    body += "    signal buf_input_r    : std_logic_vector(" + str(BUFFER_SIZE-1) + " downto 0);\n"
    body += "    signal bits_in_buffer : integer range 0 to " + str(BUFFER_SIZE) + ";\n\n"

    body += "    -- Output registers.\n"
    body += "    signal buf_output_r : std_logic_vector(" + str(OUT_WIDTH-1) + " downto 0);\n"
    body += "    signal out_rdy_r    : std_logic;\n\n"

    body += """
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
    process(reset_in, user_clk, enable_in)
    begin

        if reset_in = '0' then

            buf_input_r    <= (others=>'0');
            bits_in_buffer <= 0;

            buf_output_r   <= (others=>'0');
            out_rdy_r      <= '0';

            congestion_out <= '0';

        elsif rising_edge(user_clk) then

    """
#        elsif rising_edge(user_clk) and enable_in = '1' then

#    """
            
    body += "\n\n" + tab2 + "-- If bits_in_buffer is less than " + str(OUT_WIDTH) + ", the output will consist\n"
    body += tab2 + "--   of both the input and the buffer.\n\n"


    #body += tab2 + "if in_rdy = '1' and bits_in_buffer < " + str(BUFFER_SIZE - (IN_WIDTH - OUT_WIDTH)) + " then\n"
    body += tab2 + "case bits_in_buffer is\n"


    # Special case when buffer is empty.
    body += tab2 + "when 0 =>\n"

    body += tab3 + "if in_rdy = '1' and enable_in = '1' then\n" 
    body += tab4 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(28) + " <= data_in(" + str(OUT_WIDTH-1) + " downto 0);\n"
    body += tab4 + ("buf_input_r(" + str(IN_WIDTH - OUT_WIDTH - 1) + " downto " + str(0) + ")").ljust(28) + " <= data_in(" + str(IN_WIDTH - 1) + " downto " + str(OUT_WIDTH) + ");\n"

    # Only for debugging waveforms, set the rest to X so it's easy to see unused bits.
    if DEBUG:
        body += tab4 + ("buf_input_r(" + str(BUFFER_SIZE-1) + " downto " + str(IN_WIDTH - OUT_WIDTH) + ")").ljust(28) + " <= (others=>'X');\n"

    body += tab4 + ("bits_in_buffer").ljust(28) + " <= " + str(IN_WIDTH - OUT_WIDTH ) + ";\n"
    body += tab4 + ("out_rdy_r").ljust(28) + " <= '1';\n"
    body += tab3 + "else\n"
    body += tab4 + ("out_rdy_r").ljust(28) + " <= '0';\n"    
    body += tab3 + "end if;\n"
    body += tab3 + ("congestion_out").ljust(32) + " <= '0';\n"


    for i in range(1,OUT_WIDTH):
        # Requires both buffer and in data
        # The last case will have a rest of; bits_in_buffer = OUT_WIDTH
        body += tab2 + "when " + str(i) + " =>\n"
        body += tab3 + "if in_rdy = '1' and enable_in = '1' then\n"
        body += tab4 + ("buf_output_r(" + str(i-1) + " downto 0)").ljust(28) + " <= buf_input_r(" + str(i-1) + " downto 0);\n"
        body += tab4 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto " + str(i) + ")").ljust(28) + " <= data_in(" + str(OUT_WIDTH-i-1) + " downto 0);\n"
        body += tab4 + ("buf_input_r(" + str(IN_WIDTH - OUT_WIDTH + i - 1) + " downto " + str(0) + ")").ljust(28) + " <= data_in(" + str(IN_WIDTH-1) + " downto " + str(OUT_WIDTH-i) + ");\n"

        if DEBUG:
            body += tab4 + ("buf_input_r(" + str(BUFFER_SIZE-1) + " downto " + str(IN_WIDTH - OUT_WIDTH + i) + ")").ljust(28) + " <= (others=>'X');\n"

        body += tab4 + ("bits_in_buffer").ljust(28) + " <= " + str(IN_WIDTH - OUT_WIDTH + i) + ";\n"
        body += tab4 + ("out_rdy_r").ljust(28) + " <= '1';\n"
        body += tab3 + "else\n"
        body += tab4 + ("out_rdy_r").ljust(28) + " <= '0';\n"    
        body += tab3 + "end if;\n"
        body += tab3 + ("congestion_out").ljust(32) + " <= '0';\n"

    #body += tab4 + "when others =>\n"
    #body += tab3 + "end case;\n\n\n"









    body += "\n\n" + tab2 + "-- For this range, the buffer has enough bits saved for the output.\n\n"
    #body += tab2 + "elsif in_rdy = '1' and bits_in_buffer <= " + str(IN_WIDTH) + " then\n"
    #body += tab3 + "case bits_in_buffer is\n"

    # Special case when buffer has exactly enough bits.
    body += tab2 + "when " + str(OUT_WIDTH) + " =>\n"
    body += tab3 + "if enable_in = '1' then\n"

    body += tab3 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(32) + " <= buf_input_r(" + str(OUT_WIDTH-1) + " downto 0);\n"
    body += tab3 + "if in_rdy = '1' then\n"
    body += tab4 + ("buf_input_r(" + str(IN_WIDTH - 1) + " downto " + str(0) + ")").ljust(28) + " <= data_in(" + str(IN_WIDTH-1) + " downto " + str(0) + ");\n"

    body += tab4 + ("buf_input_r(" + str(BUFFER_SIZE - 1) + " downto " + str(IN_WIDTH) + ")").ljust(28) + " <= data_in(" + str(IN_WIDTH-1) + " downto " + str(0) + ");\n"

    body += tab4 + ("bits_in_buffer").ljust(28) + " <= " + str(IN_WIDTH) + ";\n"
    body += tab3 + "else\n"
    body += tab4 + ("bits_in_buffer").ljust(28) + " <= " + str(0) + ";\n"
    body += tab3 + "end if;\n" 
    body += tab3 + "end if;\n" 
    body += tab3 + ("congestion_out").ljust(32) + " <= '0';\n"
    body += tab3 + ("out_rdy_r").ljust(32) + " <= '1';\n"
        
    yes = BUFFER_SIZE - IN_WIDTH + OUT_WIDTH


    for i in range(OUT_WIDTH+1, IN_WIDTH+2):
        # Needs only the buffered data, all data in will be saved.
        # Therefore we are close to congestion as well.
        # Generates to bits_in_buffer = 127
        body += tab2 + "when " + str(i) + " =>\n"
        body += tab3 + "if enable_in = '1' then\n"
        body += tab3 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(32) + " <= buf_input_r(" + str(OUT_WIDTH-1) + " downto 0);\n"
        body += tab3 + ("buf_input_r(" + str(i - OUT_WIDTH - 1) + " downto " + str(0) + ")").ljust(32) + " <= buf_input_r(" + str(i-1) + " downto " + str(OUT_WIDTH) + ");\n"
        body += tab3 + "if in_rdy = '1' then\n"
        body += tab4 + ("buf_input_r(" + str(IN_WIDTH+i-1-OUT_WIDTH) + " downto " + str(i-OUT_WIDTH) + ")").ljust(28) + " <= data_in(" + str(IN_WIDTH-1) + " downto " + str(0) + ");\n"
        body += tab4 + ("bits_in_buffer").ljust(28) + " <= " + str(IN_WIDTH - OUT_WIDTH + i) + ";\n"
        body += tab3 + "else\n"

        if DEBUG:
            body += tab4 + ("buf_input_r(" + str(IN_WIDTH+i-1-OUT_WIDTH) + " downto " + str(i-OUT_WIDTH) + ")").ljust(28) + " <= (others=>'X');\n"

        body += tab4 + ("bits_in_buffer").ljust(28) + " <= " + str(i - OUT_WIDTH) + ";\n"
        body += tab3 + "end if;\n"

        if DEBUG:
            body += tab3 + ("buf_input_r(" + str(BUFFER_SIZE - 1) + " downto " + str(IN_WIDTH+i-OUT_WIDTH) + ")").ljust(32) + " <= (others=>'X');\n"

        body += tab3 + "end if;\n" 
        body += tab3 + ("congestion_out").ljust(32) + " <= '0';\n"
        body += tab3 + ("out_rdy_r").ljust(32) + " <= '1';\n"











    body += "\n\n" + tab2 + "-- For this range, congestion_out is asserted if in_rdy = '1'.\n"
    body += tab2 + "-- Because the minimum bits_in_buffer here if in_rdy = '1', is " + str(IN_WIDTH + OUT_WIDTH + 1) + ". Maximum is " + str(BUFFER_SIZE) + ".\n"
    body += tab2 + "-- Therefore there is no space left for another input since; " + \
                    str(IN_WIDTH + OUT_WIDTH + 1) + "(in buffer) + " + str(IN_WIDTH) + "(input) - " + str(OUT_WIDTH) + "(out)" + \
                    " = " + str(IN_WIDTH + OUT_WIDTH + 1 + IN_WIDTH - OUT_WIDTH) + " > " + str(BUFFER_SIZE) + "(size).\n\n"
    for i in range(IN_WIDTH+2, yes+1):
        # Needs only the buffered data, all data in will be saved.
        # Therefore we are close to congestion as well.
        # Generates to bits_in_buffer = 127
        body += tab2 + "when " + str(i) + " =>\n"
        body += tab3 + "if enable_in = '1' then\n"
        body += tab3 +      ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(32) + " <= buf_input_r(" + str(OUT_WIDTH-1) + " downto 0);\n"
        body += tab3 +      ("buf_input_r(" + str(i - OUT_WIDTH - 1) + " downto " + str(0) + ")").ljust(32) + " <= buf_input_r(" + str(i-1) + " downto " + str(OUT_WIDTH) + ");\n"
        body += tab3 +      "if in_rdy = '1' then\n"
        body += tab4 +           ("buf_input_r(" + str(IN_WIDTH+i-1-OUT_WIDTH) + " downto " + str(i-OUT_WIDTH) + ")").ljust(28) + " <= data_in(" + str(IN_WIDTH-1) + " downto " + str(0) + ");\n"
        body += tab4 +           ("bits_in_buffer").ljust(28) + " <= " + str(IN_WIDTH - OUT_WIDTH + i) + ";\n"
        body += tab4 +           ("congestion_out").ljust(28) + " <= '1';\n"
        body += tab3 +      "else\n"

        if DEBUG:
            body += tab4 +      ("buf_input_r(" + str(IN_WIDTH+i-1-OUT_WIDTH) + " downto " + str(i-OUT_WIDTH) + ")").ljust(28) + " <= (others=>'X');\n"

        body += tab4 +          ("bits_in_buffer").ljust(28) + " <= " + str(i - OUT_WIDTH) + ";\n"
        body += tab4 +          ("congestion_out").ljust(28) + " <= '0';\n"
        body += tab3 +      "end if;\n"

        if DEBUG:
            body += tab4 + ("buf_input_r(" + str(BUFFER_SIZE - 1) + " downto " + str(IN_WIDTH+i-OUT_WIDTH) + ")").ljust(28) + " <= (others=>'X');\n"

            body += tab3 + ("out_rdy_r").ljust(32) + " <= '1';\n"

        body += tab3 + "end if;\n" 

    #body += tab4 + "when others =>\n"
    #body += tab3 + "end case;\n\n\n"










    body += "\n\n" + tab2 + "-- For this range, the buffer contains to many bits to receieve another input.\n"
    body += tab2 + "-- That is why the congestion_out was asserted high in the previous range, and set low here.\n\n"
    #body += tab2 + "elsif bits_in_buffer > " + str(BUFFER_SIZE - (IN_WIDTH - OUT_WIDTH)) + " then\n"
    #body += tab3 + "case bits_in_buffer is\n"
    for i in range(yes+1, BUFFER_SIZE+1):
        #pass
        # Here we assume the congestion signal i sasserted high.
        # No data is available on the input.
        body += tab2 + "when " + str(i) + " =>\n"
        body += tab3 + "if enable_in = '1' then\n"
        body += tab3 +      ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(28) + " <= buf_input_r(" + str(OUT_WIDTH-1) + " downto 0);\n"
        body += tab3 +      ("buf_input_r(" + str(i - OUT_WIDTH - 1) + " downto " + str(0) + ")").ljust(28) + " <= buf_input_r(" + str(i-1) + " downto " + str(OUT_WIDTH) + ");\n"

        if DEBUG:
            body += tab3 + ("buf_input_r(" + str(BUFFER_SIZE - 1) + " downto " + str(i - OUT_WIDTH) + ")").ljust(28) + " <= (others=>'X');\n"

        body += tab3 +      ("bits_in_buffer").ljust(28) + " <= " + str(i - OUT_WIDTH) + ";\n"

        

        body += tab3 +      ("out_rdy_r").ljust(28) + " <= '1';\n"
        body += tab3 + "end if;\n" 

        
        if i - OUT_WIDTH <= BUFFER_SIZE - IN_WIDTH:
            body += tab3 + ("congestion_out").ljust(28) + " <= '0';\n"
        else:
            body += tab3 + ("congestion_out").ljust(28) + " <= '1';\n"
    #body += tab2 + "when others =>\n"
    body += tab2 + "end case;\n"

    # body += tab2 + "elsif in_rdy = '0' and bits_in_buffer = " + str(OUT_WIDTH) + " then\n"
    # body += tab3 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(28) + " <= buf_input_r(" + str(OUT_WIDTH-1) + " downto 0);\n"
    # body += tab3 + ("bits_in_buffer").ljust(28) + " <= " + str(0) + ";\n"
    # body += tab3 + ("congestion_out").ljust(28) + " <= '0';\n"
    # body += tab3 + ("out_rdy_r").ljust(28) + " <= '1';\n"


    # body += tab2 + "elsif in_rdy = '0' and bits_in_buffer >= " + str(OUT_WIDTH) + " then\n"
    # body += tab3 + ("buf_output_r(" + str(OUT_WIDTH-1) + " downto 0)").ljust(28) + " <= buf_input_r(" + str(OUT_WIDTH-1) + " downto 0);\n"
    # body += tab3 + ("buf_input_r(" + str(BUFFER_SIZE - OUT_WIDTH - 1) + " downto " + str(0) + ")").ljust(28) + " <= buf_input_r(" + str(BUFFER_SIZE-1) + " downto " + str(OUT_WIDTH) + ");\n"
    # body += tab3 + ("bits_in_buffer").ljust(28) + " <= " + str(IN_WIDTH - OUT_WIDTH + i) + ";\n"
    # body += tab3 + ("congestion_out").ljust(28) + " <= '0';\n"
    # body += tab3 + ("out_rdy_r").ljust(28) + " <= '1';\n"


    body += """
        end if;
    end process the_buffing_process;
    """

    body += "end architecture arch_" + ENTITYNAME + ";"



    with open(FILENAME,'w') as file:
        file.write(body)