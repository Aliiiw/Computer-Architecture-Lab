`timescale 1ns / 1ps

module Cache(
		input [31:0]address,
		input [127:0]dataLine,
		input clock,
		output reg [31:0]instruction,
		output reg hit
    );
	 
	 reg [160:0]cache[7:0];
	 
	 initial begin 
		hit = 0;
	 end
	 
	 always@(posedge clock) begin
		if(address[31:7] == cache[address[6:4]][152:128] && cache[address[6:4]][153] == 1) begin
			hit = 1;
			if(address[3:2] == 0) begin
				instruction = cache[address[6:4]][31:0];
			end
			else if(address[3:2] == 1) begin
				instruction = cache[address[6:4]][63:32];
			end
			else if(address[3:2] == 2) begin
				instruction = cache[address[6:4]][95:64];
			end
			else if(address[3:2] == 3) begin
				instruction = cache[address[6:4]][127:96];
			end
			
		end 
		else begin
			hit = 0;
			//instruction = 32'bx;
		end
	 end
	 
	 always@(dataLine) begin
		if(dataLine !== 128'bx)begin
			cache[address[6:4]][153] = 1;
			cache[address[6:4]][152:128] = address[31:7];
			cache[address[6:4]][127:0] = dataLine;
		end
	 end



endmodule

