`timescale 1ns/100ps

module tr(trld, trclr, trinr, clk, trin, trout);

input [15:0] trin;
output [15:0] trout;
input trclr, trinr, trld;
input clk;

reg [15:0] r_tr;

initial
begin
	r_tr <= 0;
end

assign trout = r_tr;

always@(posedge clk)
begin
	if(trclr) r_tr <= 0;
	else if(trinr) r_tr <= r_tr + 1;
	else if(trld) #5 r_tr <= trin;
end

endmodule
