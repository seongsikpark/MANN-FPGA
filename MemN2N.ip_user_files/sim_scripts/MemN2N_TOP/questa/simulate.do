onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MemN2N_TOP_opt

do {wave.do}

view wave
view structure
view signals

do {MemN2N_TOP.udo}

run -all

quit -force
