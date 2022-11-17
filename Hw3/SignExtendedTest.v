`timescale 1ns / 1ps

module SignExtendedTest;

	// Inputs
	reg [15:0] originValue;

	// Outputs
	wire [31:0] signExtendedValue;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.originValue(originValue), 
		.signExtendedValue(signExtendedValue)
	);

	initial begin
		// Initialize Inputs
		
	
		originValue = 16'b1000000000000001;
		
		#100;
		
		originValue = 16'b111;

	end
      
endmodule

