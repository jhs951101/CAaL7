
module FetchCircuit(clk, s, write, sc_inr, sc_clr, pc_ld, pc_clr, dr_ld, dr_inr, dr_clr, 
			tr_ld, tr_inr, tr_clr, outr_ld, r,
			sys_bus, w_ar_data, w_pc_data, w_ir_data, w_mem_data, w_dr_data, w_ac_data, 
			w_tr_data, inp_r);
input clk;
output [2:0] s;

input write;
input pc_ld, pc_clr;
input sc_inr, sc_clr;
input dr_ld, dr_inr, dr_clr;
input tr_ld, tr_inr, tr_clr;
input outr_ld;
input r;

wire ar_ld, ar_inr, ar_clr;
wire ac_ld, ac_inr, ac_clr;

output [15:0] sys_bus;
output [11:0] w_ar_data;
output [11:0] w_pc_data;
output [15:0] w_ir_data;
output [15:0] w_mem_data;
output [15:0] w_dr_data;
output [15:0] w_ac_data;
output [15:0] w_tr_data;

output [7:0] inp_r;
reg [7:0] inp_r;

wire [7:0] dec_out1;
wire [7:0] dec_out2;
wire iff_data;
wire [15:0] addlog_out;

initial begin
	inp_r <= 0;
end

ControlUnit u0(sc_inr, sc_clr, w_ir_data, clk, s, dec_out1, dec_out2, iff_data);
ControlUnit_ar u12(dec_out1, dec_out2, iff_data, r, ar_ld, ar_inr, ar_clr);
ControlUnit_ac u13(dec_out1, dec_out2, iff_data, r, w_ir_data, ac_ld, ac_inr, ac_clr);

bus u1(s, clk, dec_out1[1], w_mem_data, w_ar_data, w_pc_data, w_ir_data, w_dr_data, w_ac_data, w_tr_data, sys_bus);

ar u2(ar_ld, ar_clr, ar_inr, clk, sys_bus, w_ar_data);
pc u3(pc_ld, pc_clr, dec_out1[1], clk, sys_bus, w_pc_data);
ir u4(dec_out1[1], clk, sys_bus, w_ir_data);
mem u5(dec_out1[1], write, w_ar_data, sys_bus, w_mem_data);
dr u6(dr_ld, dr_clr, dr_inr, clk, sys_bus, w_dr_data);
tr u7(tr_ld, tr_clr, tr_inr, clk, sys_bus, w_tr_data);
outr u8(outr_ld, sys_bus);

AdderLogic u9(w_ac_data, inp_r, w_dr_data, addlog_out);
ac u10(ac_ld, ac_clr, ac_inr, clk, addlog_out, w_ac_data);
EFlipFlop u11(addlog_out);

endmodule
