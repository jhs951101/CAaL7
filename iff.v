
module IFlipFlop(iff_in, iff_out);

input iff_in;
output iff_out;
reg iff_out;

always@(iff_in or !iff_in) begin
	iff_out <= iff_in;
end

endmodule
