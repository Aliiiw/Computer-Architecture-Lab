`timescale 1ns / 1ps

module IFIDTest;

	// Inputs
	reg clock;
	reg [31:0] nextPcInput;
	reg [31:0] instructionInput;
	reg hitInput;

	// Outputs
	wire [31:0] nextPcOutput;
	wire [31:0] instructionOutput;
	wire hitOutput;

	// Instantiate the Unit Under Test (UUT)
	IFID uut (
		.clock(clock), 
		.nextPcInput(nextPcInput), 
		.instructionInput(instructionInput), 
		.hitInput(hitInput), 
		.nextPcOutput(nextPcOutput), 
		.instructionOutput(instructionOutput), 
		.hitOutput(hitOutput)
	);

	initial begin
		
		clock = 0;
		
		nextPcInput = 0;
		instructionInput = 32'b1;
		hitInput = 0;
		#100;
		
		nextPcInput = 4;
		instructionInput = 32'b10;
		hitInput = 1;
		#100;

		nextPcInput = 8;
		instructionInput = 32'b11;
		hitInput = 0;
		#100;

		nextPcInput = 12;
		instructionInput = 32'b100;
		hitInput = 0;
		#100;
		
		nextPcInput = 16;
		instructionInput = 32'b101;
		hitInput = 1;

	end
	
always #50 clock = ~clock;
      
endmodule

