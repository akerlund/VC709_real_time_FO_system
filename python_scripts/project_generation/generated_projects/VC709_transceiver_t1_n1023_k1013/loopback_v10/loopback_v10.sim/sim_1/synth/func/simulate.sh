#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado2017/Vivado/2017.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim transceiver_module_tb1_func_synth -key {Post-Synthesis:sim_1:Functional:transceiver_module_tb1} -tclbatch transceiver_module_tb1.tcl -view /home/freakuency/Vivado/MAY/loopback_v10/loopback_v10.srcs/sim_1/imports/transceiever_module/transceiver_module_tb1_behav.wcfg -log simulate.log
