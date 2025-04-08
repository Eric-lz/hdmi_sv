// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module rgb2dvi_0 (
  TMDS_Clk_p,
  TMDS_Clk_n,
  TMDS_Data_p,
  TMDS_Data_n,
  aRst,
  vid_pData,
  vid_pVDE,
  vid_pHSync,
  vid_pVSync,
  PixelClk
);

  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS CLK_P" *)
  (* X_INTERFACE_MODE = "master TMDS" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TMDS, BOARD.ASSOCIATED_PARAM TMDS_BOARD_INTERFACE" *)
  output TMDS_Clk_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS CLK_N" *)
  output TMDS_Clk_n;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS DATA_P" *)
  output [2:0]TMDS_Data_p;
  (* X_INTERFACE_INFO = "digilentinc.com:interface:tmds:1.0 TMDS DATA_N" *)
  output [2:0]TMDS_Data_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AsyncRst RST" *)
  (* X_INTERFACE_MODE = "slave AsyncRst" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AsyncRst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  input aRst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB DATA" *)
  (* X_INTERFACE_MODE = "slave RGB" *)
  input [23:0]vid_pData;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB ACTIVE_VIDEO" *)
  input vid_pVDE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB HSYNC" *)
  input vid_pHSync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 RGB VSYNC" *)
  input vid_pVSync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 PixelClk CLK" *)
  (* X_INTERFACE_MODE = "slave PixelClk" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PixelClk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN , ASSOCIATED_BUSIF , ASSOCIATED_PORT , ASSOCIATED_RESET , INSERT_VIP 0" *)
  input PixelClk;

  // stub module has no contents

endmodule
