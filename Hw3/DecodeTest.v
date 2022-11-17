`timescale 1ns / 1ps

module DecodeTest;

	// Inputs
	reg clock;
	reg [31:0] instruction;

	// Outputs
	wire [5:0] opCode;
	wire [31:0] readDataNumberOne;
	wire [31:0] readDataNumberTwo;
	wire [31:0] signExtendedImmediate;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	Decode uut (
		.clock(clock), 
		.instruction(instruction), 
		.opCode(opCode), 
		.readDataNumberOne(readDataNumberOne), 
		.readDataNumberTwo(readDataNumberTwo), 
		.signExtendedImmediate(signExtendedImmediate), 
		.rt(rt), 
		.rd(rd)
	);
	
	always #50 clock = ~clock;

	initial begin
		// Initialize Inputs
		clock = 0;
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		instruction = 32'b00000000001000100001100000000000;
		
        	// Add stimulus here

	end
      
endmodule

