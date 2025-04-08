// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module dvi2rgb_0 (
  TMDS_Clk_p,
  TMDS_Clk_n,
  TMDS_Data_p,
  TMDS_Data_n,
  RefClk,
  aRst,
  vid_pData,
  vid_pVDE,
  vid_pHSync,
  vid_pVSync,
  PixelClk,
  aPixelClkLckd,
  pLocked,
  SDA_I,
  SDA_O,
  SDA_T,
  SCL_I,
  SCL_O,
  SCL_T,
  pRst
);

  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS CLK_P" *)
  (* X_INTERFACE_MODE = "slave TMDS" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TMDS, BOARD.ASSOCIATED_PARAM TMDS_BOARD_INTERFACE" *)
  input TMDS_Clk_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS CLK_N" *)
  input TMDS_Clk_n;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS DATA_P" *)
  input [2:0]TMDS_Data_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS DATA_N" *)
  input [2:0]TMDS_Data_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 RefClk CLK" *)
  (* X_INTERFACE_MODE = "slave RefClk" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RefClk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN , ASSOCIATED_BUSIF , ASSOCIATED_PORT , ASSOCIATED_RESET , INSERT_VIP 0" *)
  input RefClk;
  (* X_INTERFACE_IGNORE = "true" *)
  input aRst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB DATA" *)
  (* X_INTERFACE_MODE = "master RGB" *)
  output [23:0]vid_pData;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB ACTIVE_VIDEO" *)
  output vid_pVDE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB HSYNC" *)
  output vid_pHSync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB VSYNC" *)
  output vid_pVSync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 PixelClk CLK" *)
  (* X_INTERFACE_MODE = "master PixelClk" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PixelClk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN , ASSOCIATED_BUSIF , ASSOCIATED_PORT , ASSOCIATED_RESET , INSERT_VIP 0" *)
  output PixelClk;
  (* X_INTERFACE_IGNORE = "true" *)
  output aPixelClkLckd;
  (* X_INTERFACE_IGNORE = "true" *)
  output pLocked;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC SDA_I" *)
  (* X_INTERFACE_MODE = "master DDC" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDC, BOARD.ASSOCIATED_PARAM IIC_BOARD_INTERFACE" *)
  input SDA_I;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC SDA_O" *)
  output SDA_O;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC SDA_T" *)
  output SDA_T;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC SCL_I" *)
  input SCL_I;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC SCL_O" *)
  output SCL_O;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC SCL_T" *)
  output SCL_T;
  (* X_INTERFACE_IGNORE = "true" *)
  input pRst;

  // stub module has no contents

endmodule
