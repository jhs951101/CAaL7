
module ControlLogicGates(dec_out1, dec_out2, iff_out, ir_data, s);

input [7:0] dec_out1, dec_out2;
input iff_out;
input [15:0] ir_data;  // !
output [2:0] s;

assign s[0] = dec_out1[1];
or(s[1],  dec_out1[0],  dec_out1[1]);
assign s[2] = dec_out1[1];

endmodule
