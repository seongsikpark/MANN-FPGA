onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L gtwizard_ultrascale_v1_5_4 -lib xil_defaultlib xil_defaultlib.pcie_ku xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {pcie_ku.udo}

run -all

quit -force
