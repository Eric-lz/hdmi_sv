// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module v_tc_0 (
  clk,
  clken,
  gen_clken,
  sof_state,
  hblank_out,
  vblank_out,
  resetn,
  fsync_out
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *)
  (* X_INTERFACE_MODE = "slave clk_intf" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF vtiming_in:vtiming_out, ASSOCIATED_RESET resetn, ASSOCIATED_CLKEN clken, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN , ASSOCIATED_PORT , INSERT_VIP 0" *)
  input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 clken_intf CE" *)
  (* X_INTERFACE_MODE = "slave clken_intf" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clken_intf, POLARITY ACTIVE_HIGH" *)
  input clken;
  (* X_INTERFACE_IGNORE = "true" *)
  input gen_clken;
  (* X_INTERFACE_IGNORE = "true" *)
  input sof_state;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out HBLANK" *)
  (* X_INTERFACE_MODE = "master vtiming_out" *)
  output hblank_out;
  (* X_INTERFACE_INFO = "xilinx.com:interface:video_timing:2.0 vtiming_out VBLANK" *)
  output vblank_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn_intf RST" *)
  (* X_INTERFACE_MODE = "slave resetn_intf" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn_intf, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input resetn;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]fsync_out;

  // stub module has no contents

endmodule
