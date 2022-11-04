`timescale 1ns / 1ps

module CacheTest;

	// Inputs
	reg [127:0] data;
	reg clock;
	reg [31:0] address;

	// Outputs
	wire [31:0] instruction;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	Cache uut (
		.data(data), 
		.clock(clock), 
		.address(address), 
		.instruction(instruction), 
		.hit(hit)
	);

	initial begin
	
		clock = 0;
		
	end
	
	
	
	initial begin
		address = 32'b1;
		#200;
		
		data = 128'b00001111000011100000110100001100000010110000101000001001000010000000011100000110000001010000010000000011000000100000000100000000;
		#100;
		
		
		address = 32'b101;   
		#100;
		
		address = 32'b111;   
		#100;
		
		address = 32'b1000;  
		#100;
		
		address = 32'b1001;  
		#100;
		
		address = 32'b1010; 
		#100;
		
		address = 32'b1011; 
		#100;
		
		address = 32'b1111;
		
	end
	
	always #50 clock = ~clock;
      
endmodule

