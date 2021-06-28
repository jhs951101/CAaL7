`timescale 1ns/100ps

module SequenceCounter(sc_inr, sc_clr, clk, sc_out);

input sc_inr, sc_clr;
input clk;
output [7:0] sc_out;

reg [2:0] r_sc;

initial
begin
	r_sc <= 0;
end

always@(clk) begin
	if(sc_clr) r_sc <= 0;
	else if(sc_inr) begin
		if(r_sc == 7) r_sc = 0;
		else r_sc = r_sc + 1;
	end
end

decoder u0(1, r_sc, sc_out);

endmodule
