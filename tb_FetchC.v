`timescale 1ns/100ps
`include "FetchC.v"

module tb_FetchCircuit;

reg clk;
wire [2:0] s;

reg write;
reg pc_ld, pc_clr;
reg sc_inr, sc_clr;
reg dr_ld, dr_inr, dr_clr;
reg tr_ld, tr_inr, tr_clr;
reg outr_ld;
reg r;

wire [15:0] sys_bus;
wire [11:0] w_ar_data;
wire [11:0] w_pc_data;
wire [15:0] w_ir_data;
wire [15:0] w_mem_data;
wire [15:0] w_dr_data;
wire [15:0] w_ac_data;
wire [15:0] w_tr_data;
wire [7:0] inp_r;

FetchCircuit obj(clk, s, write, sc_inr, sc_clr, pc_ld, pc_clr, dr_ld, dr_inr, dr_clr, 
			tr_ld, tr_inr, tr_clr, outr_ld, r,
			sys_bus, w_ar_data, w_pc_data, w_ir_data, w_mem_data, w_dr_data, w_ac_data, 
			w_tr_data, inp_r);
initial begin
	clk = 0;
	sc_clr = 0;
	sc_inr = 0;

	write = 0;
	pc_ld = 0;
	pc_clr = 0;
	dr_ld = 0;
	dr_inr = 0;
	dr_clr = 0;
	tr_ld = 0;
	tr_inr = 0;
	tr_clr = 0;
	outr_ld = 0;
	r = 0;

	#20 sc_inr = 1;
end

always #10 clk = ~clk;

endmodule

