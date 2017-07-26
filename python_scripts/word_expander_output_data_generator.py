# Generates all outputs of a Word Expander to be used
# with a testbench.

import sys, math


INPUT_WIDTH  = 64
#INPUT_WIDTH  = 512
INPUT_ROM_ROWS  = 16

# For Expander simulations.
OUTPUT_WIDTHS = [113,127,255,512,1023,247,502,1013,239,493,1003]

# For Compressor simulations.
#OUTPUT_WIDTHS = [127,255,511,120,247,502,113,239,493,106,231,484,99,223,475]

for OUTPUT_WIDTH in OUTPUT_WIDTHS:

    PACKAGE_NAME = "word_expander_package_for_D" + str(INPUT_WIDTH) + "_N" + str(OUTPUT_WIDTH)
    FILENAME = "word_expander_package_for_D" + str(INPUT_WIDTH) + "_N" + str(OUTPUT_WIDTH) + ".vhd"
    FUNCTION_NAME = "ROM_D" + str(INPUT_WIDTH) + "_N" + str(OUTPUT_WIDTH)


    # This is the input data:
    DATA_GENERATOR_HEX = []

    if INPUT_WIDTH == 113:
        DATA_GENERATOR_HEX =   [0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000,
                                0x1FFFFFFFFFFFFFFFFFFFFFFFFFFFF,
                                0x00000000000000000000000000000]

    if INPUT_WIDTH == 64:
        select = 1
        if select == 0:
            DATA_GENERATOR_HEX =   [0x00000000000000fb,
                                    0x0706050403020100,
                                    0x0f0e0d0c0b0a0908,
                                    0x1716151413121110,
                                    0x1f1e1d1c1b1a1918,
                                    0x2726252423222120,
                                    0x2f2e2d2c2b2a2928,
                                    0x3736353433323130,
                                    0x3f3e3d3c3b3a3938,
                                    0x4746454443424140,
                                    0x4f4e4d4c4b4a4948,
                                    0x5756555453525150,
                                    0x5f5e5d5c5b5a5958,
                                    0x6766656463626160,
                                    0x6f6e6d6c6b6a6968,
                                    0x7776757473727170]

        if select == 1:
            DATA_GENERATOR_HEX =   [0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000,
                                    0xFFFFFFFFFFFFFFFF,
                                    0x0000000000000000]

    # For Compressor, make one line only ones, next one only zeros, and so on...
    if INPUT_WIDTH == 127 or INPUT_WIDTH == 255 or INPUT_WIDTH == 511:
        DATA_GENERATOR_HEX = []
        for i in range(int(INPUT_ROM_ROWS/2)):
            DATA_GENERATOR_HEX.append(2**INPUT_WIDTH-1)
            DATA_GENERATOR_HEX.append(0)


    # Formating the input data to a long string
    # We reverse them so bits get in right order
    bin_string = ""
    for i in range(len(DATA_GENERATOR_HEX)):
        bin_string += "{0:b}".format(DATA_GENERATOR_HEX[i]).zfill(INPUT_WIDTH)[::-1]

    print(bin_string)
    print("Length of bin_string = %i" % (len(bin_string)))

    # The output data is chops of length N_WIDTH the input data 
    # In order to get no rest, and have it cyclic, we need to regenerate
    #   it by copying it OUTPUT_WIDTH times.


    mega_string = ""
    for i in range(OUTPUT_WIDTH):
        mega_string += bin_string

    print("Length of mega_string = %i" % (len(mega_string)))

    print("Total output rows for comparison will be = %i" % (len(mega_string)/OUTPUT_WIDTH))

    INPUT_WIDTH*INPUT_ROM_ROWS


    # Now we generate the output data.
    output_ROM = []


    output_ROM.append("library IEEE;\n")
    output_ROM.append("use IEEE.STD_LOGIC_1164.all;\n")
    output_ROM.append("use IEEE.NUMERIC_STD.ALL;\n")
    output_ROM.append("package " + PACKAGE_NAME + " is")

    output_ROM.append("\n\n")

    output_ROM.append("    constant INPUT_WIDTH : integer := " + str(INPUT_WIDTH) + ";\n")
    output_ROM.append("    constant OUTPUT_WIDTH : integer := " + str(OUTPUT_WIDTH) + ";\n")
    output_ROM.append("    constant INPUT_ROM_ROWS : integer := " + str(INPUT_ROM_ROWS) + ";\n")

    output_ROM.append("\n\n")

    output_ROM.append("    type ROM_type_expanded is array (0 to (INPUT_WIDTH*INPUT_ROM_ROWS-1)) of std_logic_vector((OUTPUT_WIDTH-1) downto 0);\n")
    output_ROM.append("    constant ROM_expanded : ROM_type_expanded := (\n")

    for l in range(INPUT_WIDTH*INPUT_ROM_ROWS):
        output_ROM.append("            \"" + mega_string[l*OUTPUT_WIDTH:(l*OUTPUT_WIDTH+OUTPUT_WIDTH)][::-1] + "\",\n")


    # Remove "," and add ");"
    output_ROM[-1] = output_ROM[-1][0:-2] + "\n    );"

    output_ROM.append("\n\n")


    output_ROM.append("    type ROM_type_data is array (0 to (INPUT_ROM_ROWS-1)) of std_logic_vector((INPUT_WIDTH-1) downto 0);\n")
    output_ROM.append("    constant ROM_data : ROM_type_data := (\n")

    for i in range(INPUT_ROM_ROWS):
        #output_ROM.append("            x\"" + hex(DATA_GENERATOR_HEX[i])[2:].zfill(math.ceil(INPUT_WIDTH/4)) + "\",\n")
        output_ROM.append("            \"" + "{0:b}".format(DATA_GENERATOR_HEX[i]).zfill(INPUT_WIDTH) + "\",\n")


    # Remove "," and add ");"
    output_ROM[-1] = output_ROM[-1][0:-2] + "\n    );"    


    output_ROM.append("\n\n")

    output_ROM.append("    function " + "ROM_send_data" + "(index : integer) return std_logic_vector;")
    output_ROM.append("    function " + FUNCTION_NAME + "(index : integer) return std_logic_vector;")

    output_ROM.append("\n\n")

    output_ROM.append("end " + PACKAGE_NAME + ";")

    output_ROM.append("\n\n")

    output_ROM.append("package body " + PACKAGE_NAME + " is")

    output_ROM.append("\n\n")

    output_ROM.append("    function " + "ROM_send_data" + "(index : integer) return std_logic_vector is\n")
    output_ROM.append("    begin\n")
    output_ROM.append("        return ROM_data(index);\n")
    output_ROM.append("    end " + "ROM_send_data;" + "\n")

    output_ROM.append("\n\n")

    output_ROM.append("    function " + FUNCTION_NAME + "(index : integer) return std_logic_vector is\n")
    output_ROM.append("    begin\n")
    output_ROM.append("        return ROM_expanded(index);\n")
    output_ROM.append("    end " + FUNCTION_NAME + ";\n")


    output_ROM.append("\n\n")

    output_ROM.append("end " + PACKAGE_NAME + ";")

    with open(FILENAME,'w') as file:
        for i in range(len(output_ROM)):
            file.write(output_ROM[i])
