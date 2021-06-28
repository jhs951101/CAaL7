`include "FetchC.v"
`timescale 1ns/100ps

module tb_FC;

reg [2:0] s;
reg read, write;
reg ar_ld, ar_inr, ar_clr;
reg pc_ld, pc_inr, pc_clr;
reg ir_ld;
reg clk;

wire [15:0] sys_bus;

reg [15:0] w_pc_data;
reg [15:0] w_mem_data;
reg [15:0] w_ar_data;
reg [15:0] w_ir_data;
wire [15:0] w_sys_bus;

bus obj(s, w_mem_data, w_ar_data, w_pc_data, w_ir_data, w_sys_bus);

initial begin
	clk <= 0;
	pc_inr <= 0;
	pc_clr <= 0;
	ar_clr <= 0;
	ar_inr <= 0;
	pc_ld <= 0;
	ar_ld <= 0;
	read <= 0;
	write <= 0;
	ir_ld <= 0;
	s <= 3'b010;
end

initial begin
	#5 ar_ld <= 1;
	#25 ar_ld <= 0;
end

initial begin
	#20 read <= 1;
	#20 read <= 0;
end

initial begin
	#20 pc_inr <= 1;
	#20 pc_inr <= 0;
end

initial begin
	#25 s <= 3'b111;
end

initial begin
	#25 ir_ld <= 1;
	#10 ir_ld <= 0;
end

always #10 clk <= ~clk;

endmodule
