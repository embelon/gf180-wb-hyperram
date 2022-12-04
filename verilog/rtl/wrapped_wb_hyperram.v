`default_nettype none

module wrapped_wb_hyperram(
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb
);

wb_hyperram wb_hyperram 
(
    .wb_clk_i       (wb_clk_i),
    .wb_rst_i       (wb_rst_i),

    .wbs_stb_i      (wbs_stb_i),
    .wbs_cyc_i      (wbs_cyc_i),
    .wbs_we_i       (wbs_we_i),
    .wbs_sel_i      (wbs_sel_i[3:0]),
    .wbs_dat_i      (wbs_dat_i[31:0]),
    .wbs_adr_i      (wbs_adr_i[31:0]),
    .wbs_ack_o      (wbs_ack_o),
    .wbs_dat_o      (wbs_dat_o[31:0]),

    .rst_i          (la_data_in[0]),

    .hb_rstn_o      (io_out[8]),
    .hb_csn_o       (io_out[9]),
    .hb_clk_o       (io_out[10]),
    .hb_clkn_o      (io_out[11]),
    .hb_rwds_o      (io_out[12]),
    .hb_rwds_oen    (io_oeb[12]),
    .hb_rwds_i      (io_in[12]),        
    .hb_dq_o        (io_out[20:13]),
    .hb_dq_oen      (io_oeb[20:13]),
    .hb_dq_i        (io_in[20:13])
);

// enable outputs for rst, csn, clk, clkn 
assign io_oeb[11:8] = 4'h0;

endmodule	// wrapped_wb_hyperram

`default_nettype wire