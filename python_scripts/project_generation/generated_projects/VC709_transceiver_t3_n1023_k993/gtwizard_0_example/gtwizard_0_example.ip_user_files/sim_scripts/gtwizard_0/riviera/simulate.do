onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+gtwizard_0 -L xil_defaultlib -L secureip -O5 xil_defaultlib.gtwizard_0

do {wave.do}

view wave
view structure

do {gtwizard_0.udo}

run -all

endsim

quit -force
