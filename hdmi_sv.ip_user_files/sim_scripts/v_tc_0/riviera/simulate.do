transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+v_tc_0  -L xil_defaultlib -L xpm -L axi_lite_ipif_v3_0_4 -L v_tc_v6_2_9 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.v_tc_0 xil_defaultlib.glbl

do {v_tc_0.udo}

run 1000ns

endsim

quit -force
