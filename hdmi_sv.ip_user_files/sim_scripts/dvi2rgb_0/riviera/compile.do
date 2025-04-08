transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_pixclk/hdl/verilog" "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_refclk/hdl/verilog" -l xpm -l xil_defaultlib \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/tools/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_pixclk/hdl/verilog" "+incdir+../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_refclk/hdl/verilog" -l xpm -l xil_defaultlib \
"../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_pixclk/sim/ila_pixclk.v" \
"../../../../hdmi_sv.gen/sources_1/ip/dvi2rgb_0/src/ila_refclk/sim/ila_refclk.v" \

vcom -work xil_defaultlib -93  -incr \
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

