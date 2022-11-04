`timescale 1ns / 1ps

 module PC(address, nextAddress, clock, hit);
 
	input [31:0] nextAddress;
	input clock;
	input hit;
	
	output reg[31:0] address;
	
	initial begin
		address = 32'b0;
	end
	
	always @(negedge clock) 
		  begin
				if(hit == 1)
					address = nextAddress;
				
		 end

endmodule
