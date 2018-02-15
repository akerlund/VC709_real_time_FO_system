#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import sys, os, time

def ensure_dir(file_path):
    #directory = os.path.dirname(file_path) # NO, wrong, bad stackoverflow, bad.
    if not os.path.exists(file_path):
        os.makedirs(file_path)
        return False
    else:
        return True

def gen_compressor(IN_WIDTH, OUT_WIDTH):

    ENTITYNAME = "word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(OUT_WIDTH) + "OUT"

    localtime = time.asctime(time.localtime(time.time( )))
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
    port(
        clk_in    : in std_logic;
        reset_in  : in std_logic;
        enable_in : in std_logic;

"""        
    body += "        data_in     : in  std_logic_vector(" + str(IN_WIDTH-1) + " downto 0);\n"
    body += "        data_in_rdy : in  std_logic;\n\n"

    body += "        data_out     : out std_logic_vector(" + str(OUT_WIDTH-1) + " downto 0);"

    body += """
        data_out_rdy : out std_logic;
        
        input_full : out std_logic 
    );
"""

    body += "end " + ENTITYNAME + ";\n\n";
    body += "architecture arch_" + ENTITYNAME + " of " + ENTITYNAME + " is\n\n"


    REST_SIZE          = int(OUT_WIDTH) - 1
    BUFFER_SIZE        = int(IN_WIDTH) + REST_SIZE
    MAX_WORDS_BUFFERED = BUFFER_SIZE / int(OUT_WIDTH)


    body += tab2 + "signal input_register : std_logic_vector(" + str(BUFFER_SIZE-1) + " downto 0); -- (REST_SIZE+IN_WIDTH)\n"
    body += tab2 + "signal nr_of_output_words_r0             : integer range 0 to " + str(MAX_WORDS_BUFFERED) + ";\n"
    body += tab2 + "signal nr_of_output_words_r1             : integer range 0 to " + str(MAX_WORDS_BUFFERED) + ";\n"
    body += tab2 + "signal bits_in_input_register            : integer range 0 to " + str(BUFFER_SIZE) + ";\n"
    body += tab2 + "signal bits_in_input_register_after_move : integer range 0 to " + str(BUFFER_SIZE) + ";\n\n"
    
    body += tab2 + "type INPUT_STATE_TYPE is (FILL, MOVE);\n"
    body += tab2 + "signal INPUT_STATE : INPUT_STATE_TYPE;\n\n"

    word_states = tab2 + "type OUTPUT_STATE_TYPE is ("
    for w in range(MAX_WORDS_BUFFERED):
        word_states += "WORD" + str(w+1) + ","
    
    body += word_states[:-1] + ");\n"    
    body += tab2 + "signal OUTPUT_STATE : OUTPUT_STATE_TYPE;\n\n"

    body += tab2 + "signal output_register  : std_logic_vector(" + str(MAX_WORDS_BUFFERED*OUT_WIDTH-1) + " downto 0);\n\n"
        
    body += tab2 + "signal start_outputting : std_logic;\n"
    body += tab2 + "signal is_outputting    : std_logic;\n\n"
        
    body += tab2 + "signal data_out_r     : std_logic_vector(" + str(OUT_WIDTH-1) + " downto 0);\n"
    body += tab2 + "signal data_out_rdy_r : std_logic;\n\n"

    body += "begin\n\n"

    body += """
input_process:
process(reset_in, clk_in)
begin

    if reset_in = '0' then
    
        input_register                    <= (others => '0');
        output_register                   <= (others => '0');
        bits_in_input_register            <= 0;
        bits_in_input_register_after_move <= 0;

        INPUT_STATE            <= FILL;
        input_full             <= '0';
        OUTPUT_STATE           <= WORD1;
        
        start_outputting       <= '0';
        is_outputting          <= '0';

        nr_of_output_words_r0  <= 0; -- Used in the input process...
        nr_of_output_words_r1  <= 0; -- ... and this is a copy used in the output process.

        data_out_r             <= (others => '0');
        data_out_rdy_r         <= '0';
    
    elsif rising_edge(clk_in) and enable_in = '1' then
    
        -- Input FSM.
        if INPUT_STATE = FILL then

            start_outputting <= '0';

            if data_in_rdy = '1' then
        
                INPUT_STATE      <= MOVE;
                input_full       <= '1';

                case bits_in_input_register is
"""

    for r in range(OUT_WIDTH):
        body += tab5 + "when "+str(r)+" =>\n"
        body += tab6 + "input_register(" + str(IN_WIDTH+r-1) + " downto " + str(r) + ")     <= data_in;\n"
        body += tab6 + "--bits_in_input_register            <= " + str(IN_WIDTH+r) + ";\n"
        body += tab6 + "bits_in_input_register_after_move <= " + str((IN_WIDTH+r) % OUT_WIDTH) + ";\n"
        body += tab6 + "nr_of_output_words_r0             <= " + str(int(IN_WIDTH+r)/int(OUT_WIDTH)) + ";\n"

    body += tab5 + "when others =>\n"
    body += "               end case;\n"
    body += tab3 + "end if;\n"



    body += """
        elsif INPUT_STATE = MOVE then
            
            if is_outputting = '0' then
                INPUT_STATE            <= FILL;
"""
    body += "                output_register        <= input_register(" + str(MAX_WORDS_BUFFERED*OUT_WIDTH-1) + " downto 0);\n"

    body += tab4 + "start_outputting       <= '1';\n"

    body += tab4 + "if nr_of_output_words_r0 = " + str(int(int(IN_WIDTH)/int(OUT_WIDTH))) + " then\n"
    body += tab5 + "input_register     <= std_logic_vector(shift_right(unsigned(input_register)," + str(MAX_WORDS_BUFFERED*OUT_WIDTH-OUT_WIDTH) + "));\n"
    body += tab4 + "else\n"
    body += tab5 + "input_register     <= std_logic_vector(shift_right(unsigned(input_register)," + str(MAX_WORDS_BUFFERED*OUT_WIDTH) + "));\n"
    body += tab4 + "end if;\n"

    body += """
                bits_in_input_register <= bits_in_input_register_after_move;
                nr_of_output_words_r1  <= nr_of_output_words_r0;
                input_full             <= '0';
            else

            -- Fill the lower part so there will be a continous output.
"""
    body += tab4 + "output_register(" + str(OUT_WIDTH-1) + " downto 0) <= input_register(" + str(OUT_WIDTH-1) + " downto 0);\n"                

    body+= """
                INPUT_STATE            <= MOVE;
                start_outputting       <= '1';
                input_full             <= '1';
            end if;
            
        end if;
    """
    
    body += """        
        -- Output FSM.
        if start_outputting = '1' or is_outputting = '1' then

            data_out_rdy_r <= '1';

            case OUTPUT_STATE is
"""

    for w in range(MAX_WORDS_BUFFERED):

        body += tab4 + "when WORD" + str(w+1) + " => \n"
        body += tab5 + "data_out_r    <= output_register(" + str(OUT_WIDTH-1 + w*OUT_WIDTH) + " downto " + str(w*OUT_WIDTH) + ");\n"

        # If the last WORD, FSM should return to its beginning.
        if w == MAX_WORDS_BUFFERED-1:
            body += tab5 + "OUTPUT_STATE  <= WORD1;\n"
            body += tab5 + "is_outputting <= '0';\n"
        # If the next last, we need to check how many words that are buffered up.
        elif w == MAX_WORDS_BUFFERED-2:
            body += tab5 + "if nr_of_output_words_r1 = " + str(MAX_WORDS_BUFFERED-1) + " then\n"
            body += tab6 + "OUTPUT_STATE  <= WORD1;\n"
            body += tab6 + "is_outputting <= '0';\n"
            body += tab5 + "else\n"
            body += tab6 + "OUTPUT_STATE  <= WORD" + str(w+2) + ";\n"
            body += tab6 + "is_outputting <= '1';\n"
            body += tab5 + "end if;\n"
                        
        # Else, the FSM should just continue.
        else:
            body += tab5 + "OUTPUT_STATE  <= WORD" + str(w+2) + ";\n"
            body += tab5 + "is_outputting <= '1';\n"

    body += tab4 + "when others =>\n"
    body += tab3 + "end case;\n"



    body += """            
        else
        
            data_out_rdy_r <= '0';
            
        end if;        
    
    end if;
    """

    body += """ 
end process;

output_process:
process(reset_in, clk_in, enable_in)
begin

    if reset_in = '0' then
    
        data_out     <= (others=>'0');
        data_out_rdy <= '0';
    
    elsif rising_edge(clk_in) and enable_in = '1' then
    
        data_out     <= data_out_r;
        data_out_rdy <= data_out_rdy_r;
    
    end if;

end process;
"""

    body += "end " + "architecture arch_" + ENTITYNAME + ";"

    return body


if __name__ == "__main__":

    import compressor_tb_generator_v2

    DIRECTORY = "./new_compressors"
    ensure_dir(DIRECTORY)

    INPUT_WIDTHS = [127,255,511,120,247,502,113,239,493,106,231,484,99,223,475,1003,1013,1023]
    list.sort(INPUT_WIDTHS)

    for IN_WIDTH in INPUT_WIDTHS:
        compressor = gen_compressor(IN_WIDTH, 64) # (in, out)
        FILENAME = "word_compressor_" + str(IN_WIDTH) + "IN_to_" + str(64) + "OUT"
        with open(DIRECTORY+"/"+FILENAME+".vhd",'w') as file:
            file.write(compressor)

        tb = compressor_tb_generator_v2.gen_compressor_tb(IN_WIDTH,64)
        with open(DIRECTORY+"/"+FILENAME+"_tb1.vhd",'w') as file:
            file.write(tb)