# Process node
export PROCESS = 130

#-----------------------------------------------------
# Tech/Libs
# ----------------------------------------------------
export TECH_LEF = $(PLATFORM_DIR)/lef/sky130_osu_sc_18T.tlef
export SC_LEF = $(PLATFORM_DIR)/lef/sky130_osu_sc_18T_ls.lef

export LIB_FILES = $(PLATFORM_DIR)/lib/sky130_osu_sc_18T_ls_TT_1P8_25C.ccs.lib \
                     $(ADDITIONAL_LIBS)
export GDS_FILES = $(wildcard $(PLATFORM_DIR)/gds/*.gds) \
                     $(ADDITIONAL_GDS_FILES)

# Dont use cells to ease congestion
# Specify at least one filler cell if none

# The *probe* are for inserting probe points and have metal shapes
# on all layers.
# *lpflow* cells are for multi-power domains
#export DONT_USE_CELLS += ""
#
# Define fill cells
export FILL_CELLS = sky130_osu_sc_18T_ls__fill_1 \
	sky130_osu_sc_18T_ls__fill_2 \
	sky130_osu_sc_18T_ls__fill_4 \
	sky130_osu_sc_18T_ls__fill_8 \
	sky130_osu_sc_18T_ls__fill_16 \
	sky130_osu_sc_18T_ls__fill_32

# -----------------------------------------------------
#  Yosys
#  ----------------------------------------------------
# Set the TIEHI/TIELO cells
# These are used in yosys synthesis to avoid logical 1/0's in the netlist
export TIEHI_CELL_AND_PORT = sky130_osu_sc_18T_ls__tiehi Y
export TIELO_CELL_AND_PORT = sky130_osu_sc_18T_ls__tielo Y

# Used in synthesis
export MIN_BUF_CELL_AND_PORTS = sky130_osu_sc_18T_ls__buf_2 A Y


# Yosys mapping files
export LATCH_MAP_FILE = $(PLATFORM_DIR)/cells_latch_hd.v
export CLKGATE_MAP_FILE = $(PLATFORM_DIR)/cells_clkgate_hd.v
export ADDER_MAP_FILE ?= $(PLATFORM_DIR)/cells_adders_hd.v
#
# Define ABC driver and load
export ABC_DRIVER_CELL = sky130_osu_sc_18T_ls__buf_1
export ABC_LOAD_IN_FF = 5

#--------------------------------------------------------
# Floorplan
# -------------------------------------------------------

# Placement site for core cells
# This can be found in the technology lef
export PLACE_SITE = 18T

# IO Placer pin layers
export IO_PLACER_H = met3
export IO_PLACER_V = met2

# Define default PDN config
export PDN_CFG ?= $(PLATFORM_DIR)/pdn.cfg

export MACRO_PLACE_HALO ?= 40 40
export MACRO_PLACE_CHANNEL ?= 80 80

#---------------------------------------------------------
# Place
# --------------------------------------------------------
# Layer to use for parasitics estimations
export WIRE_RC_LAYER = met3
#
# default cell padding for cells 
export CELL_PAD_IN_SITES_GLOBAL_PLACEMENT ?= 1
export CELL_PAD_IN_SITES_DETAIL_PLACEMENT ?= 0
#

export PLACE_DENSITY ?= 0.60

# Cell padding in SITE widths to ease rout-ability
export CELL_PAD_IN_SITES ?= 4
# 
# --------------------------------------------------------
#  CTS
#  -------------------------------------------------------
# TritonCTS options
export CTS_BUF_CELL   = sky130_osu_sc_18T_ls__buf_1

# ---------------------------------------------------------
#  Route
# ---------------------------------------------------------
# FastRoute options
export MIN_ROUTING_LAYER = met1
export MAX_ROUTING_LAYER = met5
#
# Define fastRoute tcl
export FASTROUTE_TCL ?= $(PLATFORM_DIR)/fastroute.tcl

# KLayout technology file
export KLAYOUT_TECH_FILE = $(PLATFORM_DIR)/$(PLATFORM).lyt
#
# Rules for metal fill
export FILL_CONFIG = $(PLATFORM_DIR)/fill.json
#
# Template definition for power grid analysis
export TEMPLATE_PGA_CFG ?= $(PLATFORM_DIR)/template_pga.cfg

# OpenRCX extRules
export RCX_RULES = $(PLATFORM_DIR)/rcx_patterns.rules
