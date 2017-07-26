#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/Xilinx/Vivado2017/Vivado/2017.1/ids_lite/ISE/bin/lin64:/opt/Xilinx/Vivado2017/Vivado/2017.1/bin
else
  PATH=/opt/Xilinx/Vivado2017/Vivado/2017.1/ids_lite/ISE/bin/lin64:/opt/Xilinx/Vivado2017/Vivado/2017.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/opt/Xilinx/Vivado2017/Vivado/2017.1/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/opt/Xilinx/Vivado2017/Vivado/2017.1/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/freakuency/Vivado/April/VC709_transceiver_k113_n127_t2/gtwizard_0_example/gtwizard_0_example.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log gtwizard_0_exdes.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source gtwizard_0_exdes.tcl