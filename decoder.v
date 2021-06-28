
module decoder(en, c, z_d);

input [2:0] c;
input en;
output [7:0] z_d;
reg [7:0] z_d;

always@(en or c)
begin
	if(en) begin
		case(c)
			3'b000: z_d = 8'b00000001;
			3'b001: z_d = 8'b00000010;
			3'b010: z_d = 8'b00000100;
			3'b011: z_d = 8'b00001000;
			3'b100: z_d = 8'b00010000;
			3'b101: z_d = 8'b00100000;
			3'b110: z_d = 8'b01000000;
			3'b111: z_d = 8'b10000000;
			default: z_d = 8'b11111111;
		endcase
	end
		else z_d = 8'b00000000;
end

endmodule
