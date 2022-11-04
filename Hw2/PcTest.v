`timescale 1ns / 1ps

module PcTest;

	// Inputs
	reg [31:0] nextAddress;
	reg clock;
	reg hit;

	// Outputs
	wire [31:0] address;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.address(address), 
		.nextAddress(nextAddress), 
		.clock(clock), 
		.hit(hit)
	);

	initial begin
		// Initialize Inputs
		nextAddress = 0;
		clock = 1;
		hit = 0;
		#100;
		
		nextAddress = 32'b1; 
		clock = 1;
		hit = 0;
		#100;
		
		nextAddress = 32'b10; 
		clock = 0;
		hit = 0;
		#100;
		
		nextAddress = 32'b11; 
		clock = 1;
		hit = 1;
		#100;
		
		nextAddress = 32'b100;
		clock = 0;
		hit = 1;

	end
      
endmodule

