
module ControlUnit_ar(dec_out1, dec_out2, iff_data, r, ar_ld, ar_inr, ar_clr);

input [7:0] dec_out1, dec_out2;
input iff_data, r;
output ar_ld, ar_inr, ar_clr;

wire d7_not, r_not;
wire w1,w2,w3;

not(d7_not, dec_out2[7]);
not(r_not, r);

and(w1, d7_not, iff_data, dec_out1[3]);
and(w2, dec_out1[2], r_not);
and(w3, r_not, dec_out1[0]);
or(ar_ld, w1, w2, w3);

and(ar_inr, dec_out2[5], dec_out1[4]);

and(ar_clr, r, dec_out1[0]);

endmodule
