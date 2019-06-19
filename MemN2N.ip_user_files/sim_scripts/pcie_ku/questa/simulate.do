onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pcie_ku_opt

do {wave.do}

view wave
view structure
view signals

do {pcie_ku.udo}

run -all

quit -force
