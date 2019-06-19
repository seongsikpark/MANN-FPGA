onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ila -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.ila xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ila.udo}

run -all

endsim

quit -force
