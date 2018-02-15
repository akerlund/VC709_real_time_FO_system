#!/usr/bin/env python2
# -*- coding: utf-8 -*-
""" This script generates .vhd circuits which compares two vectors
    and outputs the number of bits which differ from eachother at
    their respective positions. Assuming 2^n sized vectors.
"""

import sys, math, time

localtime = time.asctime( time.localtime(time.time()) )

IN_WIDTH = int(64)

STAGES = int(math.log(IN_WIDTH,2))
FILENAME = "BER_circuit_" + str(IN_WIDTH) + "_bit_input.vhd"
ENTITYNAME = "BER_circuit_" + str(IN_WIDTH) + "_bit_input"

indent8 = "        "
indent12 = "            "


out_file = """----------------------------------------------------------------------------------
-- Company:  Chalmers
-- Engineer: Fredrik Åkerlund
-- 
-- Create Date: """
out_file += localtime + "\n"
out_file += """
-- Design Name: 
-- Module Name: BER_circuit - Behavioral
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

entity """

out_file += ENTITYNAME

out_file += """ is
generic
(
    IN_WIDTH  : integer := """

out_file += str(IN_WIDTH)

out_file += """\n
);
port
(
    user_clk : in  std_logic;       
    reset_in : in  std_logic;

    in_rdy   : in  std_logic;
    out_rdy  : out std_logic;

    data_in  : in  std_logic_vector((IN_WIDTH-1) downto 0);
    ref_in   : in  std_logic_vector((IN_WIDTH-1) downto 0);
    
    errors   : out std_logic_vector(15 downto 0)
    
);
end """

out_file += ENTITYNAME + ";\n\n"


out_file += "architecture arch_" + ENTITYNAME + " of " +  ENTITYNAME + " is"


out_file += """

    signal XOR_register : std_logic_vector((IN_WIDTH-1) downto 0);

"""


# Calculating the width of every stage's vector.
block_divider = 2 # Divides the IN_WIDTH, used in the below loop's condition.
stage = 1         # I.e., pipeline stage.
bits_in_block = 3 # First stage use 2-bit addition, resulting in 3-bit vector.
bits_in_stage = 0 # Dynbamically calculated.
width_of_stages = [] # Saves all.
width_of_stages.append(IN_WIDTH-1)
while not int(IN_WIDTH/block_divider) == 1:

    nr_blocks = int(IN_WIDTH/2/block_divider)
    bits_in_stage = bits_in_block * nr_blocks - 1
    width_of_stages.append(bits_in_stage)
    block_divider = block_divider*2
    stage += 1
    bits_in_block += 1
    print(bits_in_stage)


# Generate the data vectors for all stages.
for i in range(STAGES-1):

    out_file += "    "
    out_file += "signal stage_" + str(i) + " : std_logic_vector("
    out_file += str(width_of_stages[i]) + " downto 0);\n"


out_file += "    "
out_file += "signal stage_" + str(STAGES-1) + " : std_logic_vector(" + str(width_of_stages[-1]) + " downto 0);\n\n"



# Generate the delay for out_rdy, and add them to the file later (at last).
delay_connections = "\n\n" + indent8 + "out_rdy_0 <= in_rdy;\n"
for i in range(STAGES+1):

    out_file += "    "
    out_file += "signal out_rdy_" + str(i) +" : std_logic;\n"
    if not i == STAGES:
        delay_connections += indent8 + "out_rdy_" + str(i+1) + " <= out_rdy_" + str(i) + ";\n"
    else:
        delay_connections += indent8 + "out_rdy   <= out_rdy_" + str(i) + ";\n"

out_file += """

    function one_bit_adder(a : std_logic; b : std_logic) return std_logic_vector is
    begin
        if a = '0' and b = '1' then
            return "01";
        elsif a = '1' and b = '0' then
            return "01";
        elsif a = '1' and b = '1' then
            return "10";
        else
            return "00";
        end if;
    end one_bit_adder;

begin


the_error_find_process:
process(reset_in, user_clk)
begin

    if reset_in = '0' then

        XOR_register <= (others=>'0');
"""

# Adding reset to all stages

for i in range(STAGES):

    out_file += indent8
    out_file += "stage_" + str(i) + " <= (others=>'0');\n"


out_file += "\n"

for i in range(STAGES+1):

    out_file += indent8
    out_file += "out_rdy_" + str(i) +" <= '0';\n"


out_file += """
        errors <= (others=>'0');
        out_rdy   <= '0';

    elsif rising_edge(user_clk) then

        if in_rdy = '1' then

            XOR_register <= data_in xor ref_in;

        end if;\n\n
"""

# Connecting all signals for stage 0.
for k in range(int(IN_WIDTH/2)):

    out_file += indent8
    out_file += "stage_0("
    out_file += str(k*2+1) + " downto " + str(k*2) + ") <= "

    out_file += "one_bit_adder(XOR_register("
    out_file += str(k*2) + "),XOR_register(" + str(k*2+1) + "));\n"


out_file += "\n\n"



block_divider = 2
stage = 1
bits_in_block = 3
bits_in_stage = 0
while not int(IN_WIDTH/block_divider) == 2:

    nr_blocks = int(IN_WIDTH/2/block_divider)

    bits_in_stage = bits_in_block * nr_blocks

    print("Stage %i" % (stage))
    print("#Blocks in stage = %i" %  (nr_blocks))
    print("Bits in block = %i" % (bits_in_block))
    print("Bits in stage = %i\n" % (bits_in_stage))

    bits_in_prev_block = bits_in_block-1
    from_bit = bits_in_prev_block-1
    to_bit   = 0

    out_file += indent8 + "-- "
    out_file += "Stage " + str(stage) + " has " + str(nr_blocks)
    out_file += " blocks " + "each containing " + str(bits_in_block) + " bits\n"

    for i in range(int(nr_blocks)):

        out_file += indent8
        out_file += "stage_" + str(stage) + "("
        out_file += str(bits_in_block*i+bits_in_block-1)
        out_file += " downto "
        out_file += str(bits_in_block*i)

        out_file += ") <= "

        if stage >= 1:
            out_file += "std_logic_vector(resize(unsigned("

        out_file += "stage_" + str(stage-1) + "("
        out_file += str(from_bit)
        out_file += " downto "
        out_file += str(to_bit) + ")"

        if stage >= 1:
            out_file += ")," + str(bits_in_block) + ")"

        out_file += " + "
        from_bit += bits_in_prev_block
        to_bit   += bits_in_prev_block


        if stage >= 1:
            out_file += "resize(unsigned("

        out_file += "stage_" + str(stage-1) + "("
        out_file += str(from_bit)
        out_file += " downto "
        out_file += str(to_bit) + ")"


        if stage >= 1:
            out_file += ")," + str(bits_in_block) + "));\n"
        else:
            ";\n"

        from_bit += bits_in_prev_block
        to_bit   += bits_in_prev_block

    out_file += "\n"


    block_divider = block_divider*2
    stage += 1
    bits_in_block += 1


out_file += indent8 + "-- Stage_" + str(stage)
out_file += " has 1 block with the sum of its previous.\n"
out_file += indent8 + "stage_" +str(stage) + " <= "
out_file += "std_logic_vector(resize(unsigned("
out_file += "stage_" + str(stage-1) + "("
out_file += str(int(bits_in_stage-1))
out_file += " downto "
out_file += str(int(bits_in_stage/2)) + ")), " + str(bits_in_block)
out_file += ") + resize(unsigned(stage_" + str(stage-1) + "("
out_file += str(int(bits_in_stage/2-1))
out_file += " downto 0))," + str(bits_in_block) + "));\n\n"

out_file += "        --errors <= stage_" + str(stage) + ";\n"
out_file += indent8 + "errors <= std_logic_vector(resize(unsigned(stage_" + str(stage) + "), 16));"
out_file += delay_connections

out_file += """
    end if;

end process the_error_find_process;
end architecture arch_"""
out_file += ENTITYNAME + ";\n"


with open(FILENAME,'w') as file:
       file.write(out_file)