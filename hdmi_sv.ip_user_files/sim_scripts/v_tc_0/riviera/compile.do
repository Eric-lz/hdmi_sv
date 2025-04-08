transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/v_tc_v6_2_9
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap v_tc_v6_2_9 riviera/v_tc_v6_2_9
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr -l xpm -l axi_lite_ipif_v3_0_4 -l v_tc_v6_2_9 -l xil_defaultlib \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_2_9 -93  -incr \
"../../../ipstatic/hdl/v_tc_v6_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../hdmi_sv.gen/sources_1/ip/v_tc_0/sim/v_tc_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

