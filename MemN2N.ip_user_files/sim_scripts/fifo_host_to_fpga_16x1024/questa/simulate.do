onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_host_to_fpga_16x1024_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_host_to_fpga_16x1024.udo}

run -all

quit -force