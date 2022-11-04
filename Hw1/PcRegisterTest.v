`timescale 1ns / 1ps

module PcRegisterTest;

	// Inputs
	reg [31:0] address;
	reg clock;

	// Outputs
	wire [31:0] nextAddress;

	// Instantiate the Unit Under Test (UUT)
	PcRegister uut (
		.address(address), 
		.clock(clock), 
		.nextAddress(nextAddress)
	);

	initial begin
		// Initialize Inputs
		address = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		address = 0;
		#100;
		
		address = 1;
		#100;
		
		address = 2;
		#100;
		
		address = 3;
		#100;
		
		address = 4;
		#100;
		
		address = 5;
		#100;
		

	end

always #5 clock = ~clock;
      
endmodule

