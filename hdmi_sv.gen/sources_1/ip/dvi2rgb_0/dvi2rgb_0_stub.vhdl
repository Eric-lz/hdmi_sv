-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2.1 (lin64) Build 5266912 Sun Dec 15 09:03:31 MST 2024
-- Date        : Fri Feb 21 15:24:12 2025
-- Host        : OptiPlex-4440118170 running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/ericp/nexysvideo/hdmi_sv/hdmi_sv.gen/sources_1/ip/dvi2rgb_0/dvi2rgb_0_stub.vhdl
-- Design      : dvi2rgb_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dvi2rgb_0 is
  Port ( 
    TMDS_Clk_p : in STD_LOGIC;
    TMDS_Clk_n : in STD_LOGIC;
    TMDS_Data_p : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TMDS_Data_n : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RefClk : in STD_LOGIC;
    aRst : in STD_LOGIC;
    vid_pData : out STD_LOGIC_VECTOR ( 23 downto 0 );
    vid_pVDE : out STD_LOGIC;
    vid_pHSync : out STD_LOGIC;
    vid_pVSync : out STD_LOGIC;
    PixelClk : out STD_LOGIC;
    aPixelClkLckd : out STD_LOGIC;
    pLocked : out STD_LOGIC;
    SDA_I : in STD_LOGIC;
    SDA_O : out STD_LOGIC;
    SDA_T : out STD_LOGIC;
    SCL_I : in STD_LOGIC;
    SCL_O : out STD_LOGIC;
    SCL_T : out STD_LOGIC;
    pRst : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dvi2rgb_0 : entity is "dvi2rgb_0,dvi2rgb,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of dvi2rgb_0 : entity is "yes";
end dvi2rgb_0;

architecture stub of dvi2rgb_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "TMDS_Clk_p,TMDS_Clk_n,TMDS_Data_p[2:0],TMDS_Data_n[2:0],RefClk,aRst,vid_pData[23:0],vid_pVDE,vid_pHSync,vid_pVSync,PixelClk,aPixelClkLckd,pLocked,SDA_I,SDA_O,SDA_T,SCL_I,SCL_O,SCL_T,pRst";
  attribute x_interface_info : string;
  attribute x_interface_info of TMDS_Clk_p : signal is "digilentinc.com:interface:tmds:1.0 TMDS CLK_P, xilinx.com:signal:clock:1.0 TMDS_Clk_p CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of TMDS_Clk_p : signal is "slave TMDS_Clk_p";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of TMDS_Clk_p : signal is "XIL_INTERFACENAME TMDS, BOARD.ASSOCIATED_PARAM TMDS_BOARD_INTERFACE, XIL_INTERFACENAME TMDS_Clk_p, ASSOCIATED_RESET pRst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of TMDS_Clk_n : signal is "digilentinc.com:interface:tmds:1.0 TMDS CLK_N, xilinx.com:signal:clock:1.0 TMDS_Clk_n CLK";
  attribute x_interface_mode of TMDS_Clk_n : signal is "slave TMDS_Clk_n";
  attribute x_interface_parameter of TMDS_Clk_n : signal is "XIL_INTERFACENAME TMDS_Clk_n, ASSOCIATED_RESET aRst_n:AsyncRst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of TMDS_Data_p : signal is "digilentinc.com:interface:tmds:1.0 TMDS DATA_P";
  attribute x_interface_info of TMDS_Data_n : signal is "digilentinc.com:interface:tmds:1.0 TMDS DATA_N";
  attribute x_interface_info of RefClk : signal is "xilinx.com:signal:clock:1.0 RefClk CLK";
  attribute x_interface_mode of RefClk : signal is "slave RefClk";
  attribute x_interface_parameter of RefClk : signal is "XIL_INTERFACENAME RefClk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of vid_pData : signal is "xilinx.com:interface:vid_io:1.0 RGB DATA";
  attribute x_interface_mode of vid_pData : signal is "master RGB";
  attribute x_interface_info of vid_pVDE : signal is "xilinx.com:interface:vid_io:1.0 RGB ACTIVE_VIDEO";
  attribute x_interface_info of vid_pHSync : signal is "xilinx.com:interface:vid_io:1.0 RGB HSYNC";
  attribute x_interface_info of vid_pVSync : signal is "xilinx.com:interface:vid_io:1.0 RGB VSYNC";
  attribute x_interface_info of PixelClk : signal is "xilinx.com:signal:clock:1.0 PixelClk CLK";
  attribute x_interface_mode of PixelClk : signal is "master PixelClk";
  attribute x_interface_parameter of PixelClk : signal is "XIL_INTERFACENAME PixelClk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of SDA_I : signal is "xilinx.com:interface:iic:1.0 DDC SDA_I";
  attribute x_interface_mode of SDA_I : signal is "master DDC";
  attribute x_interface_parameter of SDA_I : signal is "XIL_INTERFACENAME DDC, BOARD.ASSOCIATED_PARAM IIC_BOARD_INTERFACE";
  attribute x_interface_info of SDA_O : signal is "xilinx.com:interface:iic:1.0 DDC SDA_O";
  attribute x_interface_info of SDA_T : signal is "xilinx.com:interface:iic:1.0 DDC SDA_T";
  attribute x_interface_info of SCL_I : signal is "xilinx.com:interface:iic:1.0 DDC SCL_I";
  attribute x_interface_info of SCL_O : signal is "xilinx.com:interface:iic:1.0 DDC SCL_O";
  attribute x_interface_info of SCL_T : signal is "xilinx.com:interface:iic:1.0 DDC SCL_T";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "dvi2rgb,Vivado 2024.2.1";
begin
end;
