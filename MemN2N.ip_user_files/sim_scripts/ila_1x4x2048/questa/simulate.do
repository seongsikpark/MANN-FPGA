onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ila_1x4x2048_opt

do {wave.do}

view wave
view structure
view signals

do {ila_1x4x2048.udo}

run -all

quit -force