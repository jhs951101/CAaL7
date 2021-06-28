
module ControlUnit_ac(dec_out1, dec_out2, iff_data, r, ir_data, ac_ld, ac_inr, ac_clr);

input [7:0] dec_out1, dec_out2;
input iff_data, r;
input [11:0] ir_data;
output ac_ld, ac_inr, ac_clr;

wire w_and, w_add, w_dr, w_inpr, w_com, w_shr, w_shl;
wire p;

and(p, dec_out2[7], iff_data, dec_out1[3]);

and(w_and, dec_out2[0], dec_out1[5]);
and(w_add, dec_out2[1], dec_out1[5]);
and(w_dr, dec_out2[2], dec_out1[5]);
and(w_inpr, p, ir_data[11]);
and(w_com, r, ir_data[9]);
and(w_shr, r, ir_data[7]);
and(w_shl, r, ir_data[6]);
or(ac_ld, w_and, w_add, w_dr, w_inpr, w_com, w_shr, w_shl);

and(ac_inr, r, ir_data[5]);

and(ac_clr, r, ir_data[11]);

endmodule
