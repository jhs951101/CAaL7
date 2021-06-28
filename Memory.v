`timescale 1ns/100ps

module mem(read, write, i, memin, memout);

input [15:0] memin;
input [11:0] i;
input read, write;
output reg [15:0] memout;

reg [15:0] MEM[0:9];

initial
begin
	memout <= 0;
end

initial
begin
MEM[0] <= 16'h90aa;
MEM[1] <= 16'h72bb;
MEM[2] <= 16'h7020;
MEM[3] <= 16'h7080;
MEM[4] <= 16'h7040;
MEM[5] <= 16'h7800;
MEM[6] <= 16'ha0ee;
MEM[7] <= 16'h00dd;
MEM[8] <= 16'hf811;
MEM[9] <= 16'hf4cc;
end

always@(posedge read or posedge write)
begin
	if(read) memout <= MEM[i];
	else if(write) MEM[i] <= memin;
end

endmodule

/*module mem(addr, data, read);

input [15:0] addr;
input read;
output reg [15:0] data;

reg [15:0] MEM[0:9];

initial
begin
MEM[0] <= 16'h9xxx;
MEM[1] <= 16'h7200;
MEM[2] <= 16'h7020;
MEM[3] <= 16'h7080;
MEM[4] <= 16'h7040;
MEM[5] <= 16'h7800;
MEM[6] <= 16'hA000;
MEM[7] <= 16'h000x;
MEM[8] <= 16'h7800;
MEM[9] <= 16'hF400;
end

always@(posedge read)
begin
	#5 data <= MEM[addr];
end

endmodule*/
