`timescale 1ns/100ps

module dr(drld, drclr, drinr, clk, drin, drout);

input [15:0] drin;
output [15:0] drout;
input drclr, drinr, drld;
input clk;

reg [15:0] r_dr;

initial
begin
	r_dr <= 0;
end

assign drout = r_dr;

always@(posedge clk)
begin
	if(drclr) r_dr <= 0;
	else if(drinr) r_dr <= r_dr + 1;
	else if(drld) #5 r_dr <= drin;
end

endmodule