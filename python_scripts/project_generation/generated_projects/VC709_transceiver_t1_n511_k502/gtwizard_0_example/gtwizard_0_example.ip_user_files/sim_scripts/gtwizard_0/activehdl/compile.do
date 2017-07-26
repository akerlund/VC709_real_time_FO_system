vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../ip/gtwizard_0/gtwizard_0/example_design/gtwizard_0_tx_startup_fsm.vhd" \
"../../../ip/gtwizard_0/gtwizard_0/example_design/gtwizard_0_rx_startup_fsm.vhd" \
"../../../ip/gtwizard_0/gtwizard_0_init.vhd" \
"../../../ip/gtwizard_0/gtwizard_0_gt.vhd" \
"../../../ip/gtwizard_0/gtwizard_0_multi_gt.vhd" \
"../../../ip/gtwizard_0/gtwizard_0/example_design/gtwizard_0_sync_block.vhd" \
"../../../ip/gtwizard_0/gtwizard_0.vhd" \


