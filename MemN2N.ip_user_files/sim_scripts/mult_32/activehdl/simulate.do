onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+mult_32 -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L xbip_utils_v3_0_6 -L xbip_pipe_v3_0_2 -L xbip_bram18k_v3_0_2 -L mult_gen_v12_0_11 -O5 xil_defaultlib.mult_32 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {mult_32.udo}

run -all

endsim

quit -force
