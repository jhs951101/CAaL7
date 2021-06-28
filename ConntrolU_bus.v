
module ControlUnit(sc_inr, sc_clr, ir_data, clk, s, dec_out1, dec_out2, iff_out);

input sc_inr, sc_clr, clk;
input [15:0] ir_data;
output [2:0] s;
output [7:0] dec_out1;
output [7:0] dec_out2;
output iff_out;

wire [2:0] dec_in2;

SequenceCounter u0(sc_inr, sc_clr, clk, dec_out1);

assign dec_in2 = {ir_data[14], ir_data[13], ir_data[12]};
decoder u2(1, dec_in2, dec_out2);

IFlipFlop u3(ir_data[15], iff_out);

ControlLogicGates u4(dec_out1, dec_out2, iff_out, ir_data, s);

endmodule
