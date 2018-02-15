"""	Generates some random data, can be used, e.g., for synchronization.
"""
import random

start = """
	constant TX_ROM : ROM_type := ( 
"""

START_WORD = 251

HEX = True
if HEX:
	start += "            x\"" + hex(START_WORD)[2:].zfill(16) + "\",\n"
	print(start)

	for i in range(31):
		cool_number = random.randint(0,2**63-1)
		start += "            x\"" + hex(cool_number)[2:].zfill(16) + "\",\n"

	start = start[0:-2] + ");\n"

	print(start)	



BINARY = False
if BINARY:
	start += "            x\"" + "{0:b}".format(START_WORD).zfill(64) + "\",\n"

	for i in range(127):
		cool_number = "{0:b}".format(random.randint(0,2**64-1)).zfill(64)
		start += "            x\"" + cool_number + "\",\n"

	start = start[0:-2] + ");\n"

	print(start)


	exa = """
	    constant TX_ROM : ROM_type := (
	                x"00000000000000fb",
	                x"0706050403020100",
	                x"0f0e0d0c0b0a0908",
	                x"1716151413121110",
	                x"1f1e1d1c1b1a1918",
	                x"2726252423222120",
	                x"2f2e2d2c2b2a2928",
	                x"3736353433323130",
	                x"3f3e3d3c3b3a3938",
	                x"4746454443424140",
	                x"4f4e4d4c4b4a4948",
	                x"5756555453525150",
	                x"5f5e5d5c5b5a5958",
	                x"6766656463626160",
	                x"6f6e6d6c6b6a6968",
	                x"7776757473727170");
	                """

