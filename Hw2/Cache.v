`timescale 1ns / 1ps

	module Cache(data, clock, address, instruction, hit);

	input [127:0] data; 
	input clock;
	input [31:0] address;  
	
	output reg [31:0] instruction;  
	output reg hit;  

	reg [153:0] cache [7:0];

	integer i;
	
	initial begin  
		for(i = 0; i < 8; i = i + 1)
		begin
			cache[i] = 0;
		end
	end

	always@(data)
		begin
			if(data !== 128'bx)
				begin
					cache[address[6:4]][127:0] = data; 		  
					cache[address[6:4]][152:128] = address[31:7]; 
					cache[address[6:4]][153] = 1;                
				end
		end


	always@(posedge clock)
		begin

			if(cache[address[6:4]][152:128] == address[31:7] && cache[address[6:4]][153] == 1)
				begin
					hit = 1;
					if(address[3:2] == 2'b00)
						instruction = cache[address[6:4]][31:0];
					if(address[3:2] == 2'b01)
						instruction = cache[address[6:4]][63:32];
					if(address[3:2] == 2'b10)
						instruction = cache[address[6:4]][95:64];
					if(address[3:2] == 2'b11)
						instruction = cache[address[6:4]][127:96];
				end
			else
				begin
					hit = 0;
					instruction = 32'bx;
				end
	end

endmodule
