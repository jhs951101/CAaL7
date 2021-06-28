`timescale 1ns/100ps

module ac(acld, acclr, acinr, clk, acin, acout);

input [15:0] acin;
output [15:0] acout;
input acclr, acinr, acld;
input clk;

reg [15:0] r_ac;

initial
begin
	r_ac <= 0;
end

assign acout = r_ac;

always@(posedge clk)
begin
	if(acclr) r_ac <= 0;
	else if(acinr) r_ac <= r_ac + 1;
	else if(acld) #5 r_ac <= acin;
end

endmodule
