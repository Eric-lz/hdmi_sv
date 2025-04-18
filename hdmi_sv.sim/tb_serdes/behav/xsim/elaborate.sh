#!/usr/bin/env bash
# ****************************************************************************
# Vivado (TM) v2024.2.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Apr 03 15:01:54 -03 2025
# SW Build 5266912 on Sun Dec 15 09:03:31 MST 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail

# resolve compiled library path in xsim.ini
export RDI_DATADIR="/tools/Xilinx/Vivado/2024.2/data"

# elaborate design
echo "xelab --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_serdes_behav xil_defaultlib.tb_serdes xil_defaultlib.glbl -log elaborate.log"
xelab --incr --debug typical --relax --mt 8 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_serdes_behav xil_defaultlib.tb_serdes xil_defaultlib.glbl -log elaborate.log

