`timescale 1ns / 1ps

module muxTest;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg selector;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux uut (
		.input1(input1), 
		.input2(input2), 
		.selector(selector), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 1;
		selector = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		input1 = 1;
		input2 = 0;
		selector = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		input1 = 1;
		input2 = 0;
		selector = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

