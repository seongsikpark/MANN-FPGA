onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xbip_utils_v3_0_5 -L axi_utils_v2_0_1 -L xbip_pipe_v3_0_1 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_1 -L xbip_bram18k_v3_0_1 -L mult_gen_v12_0_10 -L floating_point_v7_0_11 -L xbip_dsp48_mult_v3_0_1 -L xbip_dsp48_multadd_v3_0_1 -L div_gen_v5_1_9 -L fifo_generator_v13_0_1 -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_8 -lib xil_defaultlib xil_defaultlib.MemN2N_TOP xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {MemN2N_TOP.udo}

run -all

quit -force
