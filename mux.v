
module mux(clk, read, a, b, c, d, e, f, g, h, s, z_m);

input clk, read;
input [15:0] a,b,c,d,e,f,g,h;
input [2:0] s;
output [15:0] z_m;
reg [15:0] z_m;

always@(posedge clk or posedge read)
begin
	case(s)
		3'b000: z_m = a;
		3'b001: z_m = b;
		3'b010: z_m = c;
		3'b011: z_m = d;
		3'b100: z_m = e;
		3'b101: z_m = f;
		3'b110: z_m = g;
		3'b111: z_m = h;
	endcase
end

endmodule
