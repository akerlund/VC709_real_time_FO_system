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
ExecStep $xv_path/bin/xelab -wto 572bd2c3515c4952bb3a75135f576d56 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot transceiver_module_tb1_func_synth xil_defaultlib.transceiver_module_tb1 -log elaborate.log
