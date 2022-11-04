`timescale 1ns / 1ps

module InstructionMemoryTest;

	// Inputs
	reg [31:0] address;
	reg clock;

	// Outputs
	wire [127:0] data;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.address(address), 
		.clock(clock), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		address = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		address = 160;
		#100;
		
		address = 320;
		
        
		// Add stimulus here

	end
	
always #20 clock = ~ clock;
      
endmodule

