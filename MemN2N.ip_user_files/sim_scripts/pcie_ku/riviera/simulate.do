onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+pcie_ku -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L gtwizard_ultrascale_v1_5_4 -O5 xil_defaultlib.pcie_ku xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {pcie_ku.udo}

run -all

endsim

quit -force
