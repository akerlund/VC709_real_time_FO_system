create_clock -period 5.000 -name clk_i [get_ports SYSCLK_P]

set_property LOC H19 [get_ports  SYSCLK_P]
set_property LOC G18 [get_ports  SYSCLK_N]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYSCLK_P]
set_property IOSTANDARD DIFF_SSTL15 [get_ports SYSCLK_N]

set_property PACKAGE_PIN AM39 	 [get_ports {GPIO_LED[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[0]}]
set_property PACKAGE_PIN AN39 	 [get_ports {GPIO_LED[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[1]}]
set_property PACKAGE_PIN AR37 	 [get_ports {GPIO_LED[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[2]}]
set_property PACKAGE_PIN AT37 	 [get_ports {GPIO_LED[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[3]}]
set_property PACKAGE_PIN AR35 	 [get_ports {GPIO_LED[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[4]}]
set_property PACKAGE_PIN AP41 	 [get_ports {GPIO_LED[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[5]}]
set_property PACKAGE_PIN AP42 	 [get_ports {GPIO_LED[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[6]}]
set_property PACKAGE_PIN AU39 	 [get_ports {GPIO_LED[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[7]}]


set_property PACKAGE_PIN AV30 	 [get_ports {GPIO_DIP[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[0]}]
set_property PACKAGE_PIN AY33 	 [get_ports {GPIO_DIP[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[1]}]
set_property PACKAGE_PIN BA31 	 [get_ports {GPIO_DIP[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[2]}]
set_property PACKAGE_PIN BA32 	 [get_ports {GPIO_DIP[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[3]}]
set_property PACKAGE_PIN AW30 	 [get_ports {GPIO_DIP[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[4]}]
set_property PACKAGE_PIN AY30 	 [get_ports {GPIO_DIP[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[5]}]
set_property PACKAGE_PIN BA30 	 [get_ports {GPIO_DIP[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[6]}]
set_property PACKAGE_PIN BB31 	 [get_ports {GPIO_DIP[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_DIP[7]}]

set_property PACKAGE_PIN AV40    [get_ports CPU_RESET]
set_property IOSTANDARD LVCMOS18 [get_ports CPU_RESET]

#USB UART
set_property PACKAGE_PIN AU36    [get_ports USB_UART_RX]
set_property IOSTANDARD LVCMOS18 [get_ports USB_UART_RX]
set_property PACKAGE_PIN AU33    [get_ports USB_UART_TX]
set_property IOSTANDARD LVCMOS18 [get_ports USB_UART_TX]
#set_property PACKAGE_PIN AR34 [get_ports USB_UART_CTS]
#set_property IOSTANDARD LVCMOS18 [get_ports USB_UART_CTS]
#set_property PACKAGE_PIN AT32 [get_ports USB_UART_RTS]
#set_property IOSTANDARD LVCMOS18 [get_ports USB_UART_RTS]

#IIC
#set_property PACKAGE_PIN AY42 [get_ports IIC_MUX_RESET_B_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports IIC_MUX_RESET_B_LS]
#set_property PACKAGE_PIN AT35 [get_ports IIC_SCL_MAIN_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports IIC_SCL_MAIN_LS]
#set_property PACKAGE_PIN AU32 [get_ports IIC_SDA_MAIN_LS]
#set_property IOSTANDARD LVCMOS18 [get_ports IIC_SDA_MAIN_LS]


#FAN
#set_property PACKAGE_PIN BA37 [get_ports SM_FAN_PWM]
#set_property IOSTANDARD LVCMOS18 [get_ports SM_FAN_PWM]
#set_property PACKAGE_PIN BB37 [get_ports SM_FAN_TACH]
#set_property IOSTANDARD LVCMOS18 [get_ports SM_FAN_TACH]


#SI5324 REC_CLOCK
#set_property PACKAGE_PIN AW33 [get_ports REC_CLOCK_C_N]
#set_property IOSTANDARD LVDS [get_ports REC_CLOCK_C_N]
#set_property PACKAGE_PIN AW32 [get_ports REC_CLOCK_C_P]
#set_property IOSTANDARD LVDS [get_ports REC_CLOCK_C_P]

#GPIO P.B. SW
#set_property PACKAGE_PIN AV39 [get_ports GPIO_SW_C]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_C]
#set_property PACKAGE_PIN AU38 [get_ports GPIO_SW_E]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_E]
#set_property PACKAGE_PIN AR40 [get_ports GPIO_SW_N]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_N]
#set_property PACKAGE_PIN AP40 [get_ports GPIO_SW_S]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_S]
#set_property PACKAGE_PIN AW40 [get_ports GPIO_SW_W]
#set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SW_W]