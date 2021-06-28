`timescale 1ns/100ps

module outr(outld, outin);

input [7:0] outin;
input outld;

reg [7:0] r_out;

initial
begin
	r_out <= 0;
end

always@(posedge outld)
begin
	#5 r_out <= outin;
end

endmodule
