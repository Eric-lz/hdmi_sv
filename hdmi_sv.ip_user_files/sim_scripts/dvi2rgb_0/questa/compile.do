vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_pixclk/hdl/verilog" "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_refclk/hdl/verilog" \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_pixclk/hdl/verilog" "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_refclk/hdl/verilog" \
"../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_pixclk/sim/ila_pixclk.v" \
"../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_refclk/sim/ila_refclk.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../ipstatic/src/DVI_Constants.vhd" \
"../../../ipstatic/src/ChannelBond.vhd" \
"../../../ipstatic/src/SyncAsync.vhd" \
"../../../ipstatic/src/GlitchFilter.vhd" \
"../../../ipstatic/src/TWI_SlaveCtl.vhd" \
"../../../ipstatic/src/EEPROM_8b.vhd" \
"../../../ipstatic/src/InputSERDES.vhd" \
"../../../ipstatic/src/PhaseAlign.vhd" \
"../../../ipstatic/src/ResyncToBUFG.vhd" \
"../../../ipstatic/src/SyncAsyncReset.vhd" \
"../../../ipstatic/src/SyncBase.vhd" \
"../../../ipstatic/src/TMDS_Clocking.vhd" \
"../../../ipstatic/src/TMDS_Decoder.vhd" \
"../../../ipstatic/src/dvi2rgb.vhd" \
"../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/sim/dvi2rgb_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

