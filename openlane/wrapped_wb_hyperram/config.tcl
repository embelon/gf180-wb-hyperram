# User config
set script_dir [file dirname [file normalize [info script]]]

# name of your project, should also match the name of the top module
set ::env(DESIGN_NAME) wrapped_wb_hyperram

set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"

# add your source files here
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/../../verilog/rtl/wrapped_wb_hyperram.v \
    $::env(DESIGN_DIR)/../../verilog/rtl/wb_hyperram/src/register_rw.v \
    $::env(DESIGN_DIR)/../../verilog/rtl/wb_hyperram/src/hyperram.sv \
    $::env(DESIGN_DIR)/../../verilog/rtl/wb_hyperram/src/wb_hyperram.sv"


# set absolute size of the die to 500 x 500 um
set ::env(DIE_AREA) "0 0 400 400"
set ::env(FP_SIZING) absolute

set ::env(FP_CORE_UTIL) 45
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

# define number of IO pads
set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

# clock period is ns
set ::env(CLOCK_PERIOD) "30"
set ::env(CLOCK_PORT) "wb_clk_i"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(RT_MAX_LAYER) {Metal4}

# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vdd}]
set ::env(GND_NETS) [list {vss}]

#set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4
