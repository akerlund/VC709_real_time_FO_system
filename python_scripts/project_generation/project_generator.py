#!/usr/bin/env python2
# -*- coding: utf-8 -*-



# This script will generated transceiver module VHDL components.
# Also new projects with these files included.

import time, os, shutil

# All these generators are for changing the 'k' and 'n' generics all around the projects.
# Keeps a copy of the files and inserts them wherever needed.
import tm_generator				# Transceiever modules
import bch_peterson_generator	# The decoder top
import compressor_generator		# 
import expander_generator		# 
import exdes_top_generator		# The example design's top which all is based upon
import transceiver_module_tb1_generator

def ensure_dir(file_path):
    #directory = os.path.dirname(file_path) # NO, wrong, bad stackoverflow, bad.
    if not os.path.exists(file_path):
        os.makedirs(file_path)
        return False
    else:
    	return True

def copytree(src, dst, symlinks=False, ignore=None):
	if not os.path.exists(dst):
		os.makedirs(dst)
	for item in os.listdir(src):
		s = os.path.join(src, item)
		d = os.path.join(dst, item)
		if os.path.isdir(s):
			copytree(s, d, symlinks, ignore)
		else:
			if not os.path.exists(d) or os.stat(s).st_mtime - os.stat(d).st_mtime > 1:
				shutil.copy2(s, d)


MAIN_DIRECTORY  = "/home/freakuency/Documents/VC709_real_time_FO_system"
FEC_FILES_DIR   = MAIN_DIRECTORY + "/FEC_files"
REF_PROJECT_DIR = "./xilinx_project" # So, in the same folder as this script.
DEST_DIR        = "./generated_projects"
LOOPBACK_DIR    = "./loopback_project"


# Make the new projects names dependent on what FEC files there are.
# So, first we make a list of all folders containing FEC .vhd files.
# We will use them to name projecs and their folders.

FEC_FOLDERS = os.listdir(FEC_FILES_DIR)
print(FEC_FOLDERS)


# Removing one register from all encoders.
for FEC_FOLDER in FEC_FOLDERS:
	temp = ""
	for line in open(FEC_FILES_DIR+"/"+FEC_FOLDER+"/enc_reg.vhd"):
		if line == "                in_data => in_data_reg,\n":
			temp += "                --in_data => in_data_reg,\n"
			temp += "                in_data => in_data,\n"
		else:
			temp += line

	with open(FEC_FILES_DIR+"/"+FEC_FOLDER+"/enc_reg.vhd",'w') as file:
		file.write(temp)

# From the names, we take out the n,k and t
FEC_NUMBERS = []
for FEC in FEC_FOLDERS:
	temp = FEC
	temp = temp.replace('t',' ') # <= Yeah, pretty ugly but works.
	temp = temp.replace('k',' ')
	temp = temp.replace('n',' ')
	temp = temp.replace('_',' ')
	FEC_NUMBERS.append([int(s) for s in temp.split() if s.isdigit()])

print(FEC_NUMBERS)



# Making all the project names.
PROJECT_NAMES = []
for fec_nrs in FEC_NUMBERS:
	if fec_nrs:
		t = fec_nrs[0]
		k = fec_nrs[1]
		n = fec_nrs[2]
		PROJECT_NAMES.append("VC709_transceiver_t"+str(t)+"_n"+str(n)+"_k"+str(k))


# for name in PROJECT_NAMES:
# 	print(name)

# Now we make all the folders for the projects.
ensure_dir(DEST_DIR)
PROJECT_FOLDERS = []
for proj_folder in PROJECT_NAMES:
	print(DEST_DIR + "/" + proj_folder)
	temp = DEST_DIR + "/" + proj_folder
	PROJECT_FOLDERS.append(temp)
	print(ensure_dir(temp))


# Copying the ref project to all folders.
cnt = 0
for proj_folder in PROJECT_FOLDERS:
	copytree(REF_PROJECT_DIR,proj_folder)

	# At the same time we are making the folder for all files
	# that will be imported.
	ensure_dir(proj_folder + "/import_these")
	copytree("./common_files",proj_folder+"/import_these")


	# Generating the transceiver module:
	tm = tm_generator.make_tm(FEC_NUMBERS[cnt][1],FEC_NUMBERS[cnt][2])
	with open(proj_folder+"/import_these"+"/transceiver_module.vhd",'w') as tm_file:
		tm_file.write(tm)

	# Generating the decoder top modules:
		# def make_bch(k,n,t):
	bch = bch_peterson_generator.make_bch(FEC_NUMBERS[cnt][1],FEC_NUMBERS[cnt][2],FEC_NUMBERS[cnt][0])		
	with open(proj_folder+"/import_these"+"/bch_peterson.vhd",'w') as bch_file:
		bch_file.write(bch)

	# Copy the BCH files:
	copytree(FEC_FILES_DIR+"/"+FEC_FOLDERS[cnt],proj_folder+"/import_these")
	
	# Generating the Expanders:
	# TX	
	EXPAND_FILENAME1 = "word_expander_" + str(64) + "IN_to_" + str(FEC_NUMBERS[cnt][1]) + "OUT.vhd"
	exp1 = expander_generator.exp_generator(64,FEC_NUMBERS[cnt][1],True)
	with open(proj_folder+"/import_these"+"/"+EXPAND_FILENAME1,'w') as exp_file:
		exp_file.write(exp1)

	# RX	
	EXPAND_FILENAME2 = "word_expander_" + str(64) + "IN_to_" + str(FEC_NUMBERS[cnt][2]) + "OUT.vhd"
	exp2 = expander_generator.exp_generator(64,FEC_NUMBERS[cnt][2],False)
	with open(proj_folder+"/import_these"+"/"+EXPAND_FILENAME2,'w') as exp_file:
		exp_file.write(exp2)


	# Generating the Compressors:
	COMP_FILENAME1 = "word_compressor_" + str(FEC_NUMBERS[cnt][1]) + "IN_to_" + str(64) + "OUT.vhd"
	comp1 = compressor_generator.gen_compressor(FEC_NUMBERS[cnt][1],64)
	with open(proj_folder+"/import_these"+"/"+COMP_FILENAME1,'w') as comp_file:
		comp_file.write(comp1)

	COMP_FILENAME2 = "word_compressor_" + str(FEC_NUMBERS[cnt][2]) + "IN_to_" + str(64) + "OUT.vhd"
	comp2 = compressor_generator.gen_compressor(FEC_NUMBERS[cnt][2],64)
	with open(proj_folder+"/import_these"+"/"+COMP_FILENAME2,'w') as comp_file:
		comp_file.write(comp2)

	# Generating the example top module
	EXDES_FILENAME = "gtwizard_0_exdes.vhd"
	with open(proj_folder+"/gtwizard_0_example/gtwizard_0_example.srcs/sources_1/imports/example_design/"+EXDES_FILENAME,'w') as ex_file:
		ex = exdes_top_generator.exdes_generator(FEC_NUMBERS[cnt][1],FEC_NUMBERS[cnt][2],1)
		ex_file.write(ex)




	# Now we generate the loopback simulation projects
	copytree(LOOPBACK_DIR,proj_folder)

	# This is the testbench
	a='/home/freakuency/Documents/VC709_real_time_FO_system/python_scripts/project_generation/loopback_project/loopback_v10/loopback_v10.srcs/sim_1/imports/transceiever_module/transceiver_module_tb1.vhd' 
	tb = transceiver_module_tb1_generator.tb_generator(FEC_NUMBERS[cnt][1],FEC_NUMBERS[cnt][2])
	with open(proj_folder+"/loopback_v10/loopback_v10.srcs/sim_1/imports/transceiever_module/transceiver_module_tb1.vhd",'w') as tb_file:
		tb_file.write(tb)

	ensure_dir(proj_folder + "/import_these_loopback_files")

	with open(proj_folder+"/import_these_loopback_files"+"/"+EXPAND_FILENAME1,'w') as exp_file:
		exp_file.write(exp1)
	with open(proj_folder+"/import_these_loopback_files"+"/"+EXPAND_FILENAME2,'w') as exp_file:
		exp_file.write(exp2)
	with open(proj_folder+"/import_these_loopback_files"+"/"+COMP_FILENAME1,'w') as comp_file:
		comp_file.write(comp1)
	with open(proj_folder+"/import_these_loopback_files"+"/"+COMP_FILENAME2,'w') as comp_file:
		comp_file.write(comp2)		
	with open(proj_folder+"/import_these_loopback_files"+"/bch_peterson.vhd",'w') as bch_file:
		bch_file.write(bch)
	with open(proj_folder+"/import_these_loopback_files"+"/transceiver_module.vhd",'w') as tm_file:
		tm_file.write(tm)
	copytree(FEC_FILES_DIR+"/"+FEC_FOLDERS[cnt],proj_folder+"/import_these_loopback_files")


	cnt += 1
