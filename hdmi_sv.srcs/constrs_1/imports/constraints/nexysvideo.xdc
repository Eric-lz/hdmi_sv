### This file is a general .xdc for the Nexys Video Rev. A
### To use it in a project:
### - uncomment the lines corresponding to used pins
### - rename the used ports (in each line, after get_ports) according to the top level signal names in the project


## Clock Signal
set_property -dict { PACKAGE_PIN R4    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_34 Sch=sysclk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


## LEDs
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS25 } [get_ports { led[0] }]; #IO_L15P_T2_DQS_13 Sch=led[0]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS25 } [get_ports { led[1] }]; #IO_L15N_T2_DQS_13 Sch=led[1]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS25 } [get_ports { led[2] }]; #IO_L17P_T2_13 Sch=led[2]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS25 } [get_ports { led[3] }]; #IO_L17N_T2_13 Sch=led[3]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS25 } [get_ports { led[4] }]; #IO_L14N_T2_SRCC_13 Sch=led[4]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS25 } [get_ports { led[5] }]; #IO_L16N_T2_13 Sch=led[5]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS25 } [get_ports { led[6] }]; #IO_L16P_T2_13 Sch=led[6]
set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS25 } [get_ports { led[7] }]; #IO_L5P_T0_13 Sch=led[7]


## Buttons
set_property -dict { PACKAGE_PIN B22 IOSTANDARD LVCMOS12 } [get_ports { btnc }]; #IO_L20N_T3_16 Sch=btnc
#set_property -dict { PACKAGE_PIN D22 IOSTANDARD LVCMOS12 } [get_ports { btnd }]; #IO_L22N_T3_16 Sch=btnd
#set_property -dict { PACKAGE_PIN C22 IOSTANDARD LVCMOS12 } [get_ports { btnl }]; #IO_L20P_T3_16 Sch=btnl
#set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS12 } [get_ports { btnr }]; #IO_L6P_T0_16 Sch=btnr
#set_property -dict { PACKAGE_PIN F15 IOSTANDARD LVCMOS12 } [get_ports { btnu }]; #IO_0_16 Sch=btnu
#set_property -dict { PACKAGE_PIN G4  IOSTANDARD LVCMOS15 } [get_ports { cpu_resetn }]; #IO_L12N_T1_MRCC_35 Sch=cpu_resetn


## Switches
set_property -dict { PACKAGE_PIN E22  IOSTANDARD LVCMOS12 } [get_ports { sw[0] }]; #IO_L22P_T3_16 Sch=sw[0]
set_property -dict { PACKAGE_PIN F21  IOSTANDARD LVCMOS12 } [get_ports { sw[1] }]; #IO_25_16 Sch=sw[1]
set_property -dict { PACKAGE_PIN G21  IOSTANDARD LVCMOS12 } [get_ports { sw[2] }]; #IO_L24P_T3_16 Sch=sw[2]
set_property -dict { PACKAGE_PIN G22  IOSTANDARD LVCMOS12 } [get_ports { sw[3] }]; #IO_L24N_T3_16 Sch=sw[3]
set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS12 } [get_ports { sw[4] }]; #IO_L6P_T0_15 Sch=sw[4]
set_property -dict { PACKAGE_PIN J16  IOSTANDARD LVCMOS12 } [get_ports { sw[5] }]; #IO_0_15 Sch=sw[5]
set_property -dict { PACKAGE_PIN K13  IOSTANDARD LVCMOS12 } [get_ports { sw[6] }]; #IO_L19P_T3_A22_15 Sch=sw[6]
set_property -dict { PACKAGE_PIN M17  IOSTANDARD LVCMOS12 } [get_ports { sw[7] }]; #IO_25_15 Sch=sw[7]


## OLED Display
#set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS33 } [get_ports { oled_dc }]; #IO_L7N_T1_D10_14 Sch=oled_dc
#set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports { oled_res }]; #IO_L4N_T0_D05_14 Sch=oled_res
#set_property -dict { PACKAGE_PIN W21   IOSTANDARD LVCMOS33 } [get_ports { oled_sclk }]; #IO_L7P_T1_D09_14 Sch=oled_sclk
#set_property -dict { PACKAGE_PIN Y22   IOSTANDARD LVCMOS33 } [get_ports { oled_sdin }]; #IO_L9N_T1_DQS_D13_14 Sch=oled_sdin
#set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { oled_vbat }]; #IO_0_14 Sch=oled_vbat
#set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports { oled_vdd }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=oled_vdd


## HDMI in
set_property -dict { PACKAGE_PIN AA5   IOSTANDARD LVCMOS33 } [get_ports { hdmi_rx_cec }]; #IO_L10P_T1_34 Sch=hdmi_rx_cec
set_property -dict { PACKAGE_PIN W4    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_clk_n }]; #IO_L12N_T1_MRCC_34 Sch=hdmi_rx_clk_n
set_property -dict { PACKAGE_PIN V4    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_clk_p }]; #IO_L12P_T1_MRCC_34 Sch=hdmi_rx_clk_p
set_property -dict { PACKAGE_PIN AB12  IOSTANDARD LVCMOS25 } [get_ports { hdmi_rx_hpa }]; #IO_L7N_T1_13 Sch=hdmi_rx_hpa
set_property -dict { PACKAGE_PIN Y4    IOSTANDARD LVCMOS33 } [get_ports { hdmi_rx_scl }]; #IO_L11P_T1_SRCC_34 Sch=hdmi_rx_scl
set_property -dict { PACKAGE_PIN AB5   IOSTANDARD LVCMOS33 } [get_ports { hdmi_rx_sda }]; #IO_L10N_T1_34 Sch=hdmi_rx_sda
set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports { hdmi_rx_txen }]; #IO_L3P_T0_DQS_34 Sch=hdmi_rx_txen
set_property -dict { PACKAGE_PIN AA3   IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_n[0] }]; #IO_L9N_T1_DQS_34 Sch=hdmi_rx_n[0]
set_property -dict { PACKAGE_PIN Y3    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_p[0] }]; #IO_L9P_T1_DQS_34 Sch=hdmi_rx_p[0]
set_property -dict { PACKAGE_PIN Y2    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_n[1] }]; #IO_L4N_T0_34 Sch=hdmi_rx_n[1]
set_property -dict { PACKAGE_PIN W2    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_p[1] }]; #IO_L4P_T0_34 Sch=hdmi_rx_p[1]
set_property -dict { PACKAGE_PIN V2    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_n[2] }]; #IO_L2N_T0_34 Sch=hdmi_rx_n[2]
set_property -dict { PACKAGE_PIN U2    IOSTANDARD TMDS_33  } [get_ports { hdmi_rx_p[2] }]; #IO_L2P_T0_34 Sch=hdmi_rx_p[2]


## HDMI out
set_property -dict { PACKAGE_PIN AA4   IOSTANDARD LVCMOS33 } [get_ports { hdmi_tx_cec }]; #IO_L11N_T1_SRCC_34 Sch=hdmi_tx_cec
set_property -dict { PACKAGE_PIN U1    IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_clk_n }]; #IO_L1N_T0_34 Sch=hdmi_tx_clk_n
set_property -dict { PACKAGE_PIN T1    IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_clk_p }]; #IO_L1P_T0_34 Sch=hdmi_tx_clk_p
set_property -dict { PACKAGE_PIN AB13  IOSTANDARD LVCMOS25 } [get_ports { hdmi_tx_hpd }]; #IO_L3N_T0_DQS_13 Sch=hdmi_tx_hpd
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { hdmi_tx_rscl }]; #IO_L6P_T0_34 Sch=hdmi_tx_rscl
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports { hdmi_tx_rsda }]; #IO_L6N_T0_VREF_34 Sch=hdmi_tx_rsda
set_property -dict { PACKAGE_PIN Y1    IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_n[0] }]; #IO_L5N_T0_34 Sch=hdmi_tx_n[0]
set_property -dict { PACKAGE_PIN W1    IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_p[0] }]; #IO_L5P_T0_34 Sch=hdmi_tx_p[0]
set_property -dict { PACKAGE_PIN AB1   IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_n[1] }]; #IO_L7N_T1_34 Sch=hdmi_tx_n[1]
set_property -dict { PACKAGE_PIN AA1   IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_p[1] }]; #IO_L7P_T1_34 Sch=hdmi_tx_p[1]
set_property -dict { PACKAGE_PIN AB2   IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_n[2] }]; #IO_L8N_T1_34 Sch=hdmi_tx_n[2]
set_property -dict { PACKAGE_PIN AB3   IOSTANDARD TMDS_33  } [get_ports { hdmi_tx_p[2] }]; #IO_L8P_T1_34 Sch=hdmi_tx_p[2]

## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]