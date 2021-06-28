`timescale 1ns/100ps

module pc(pcld, pcclr, pcinr, clk, pcin, pcout);

input [11:0] pcin;
output [11:0] pcout;
input pcclr, pcinr, pcld;
input clk;

reg [11:0] r_pc;

initial
begin
	r_pc <= 0;
end

assign pcout = r_pc;

always@(posedge clk)
begin
	if(pcclr) r_pc <= 0;
	else if(pcinr) r_pc <= r_pc + 1;
	else if(pcld) #5 r_pc <= pcin;
end

endmodule
