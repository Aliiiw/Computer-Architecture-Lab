`timescale 1ns / 1ps

module FetchTest;

	// Inputs
	reg clock;
	reg [31:0] branchTarget;
	reg pcSource;

	// Outputs
	wire [31:0] nextPc;
	wire [31:0] instruction;
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.clock(clock), 
		.branchTarget(branchTarget), 
		.pcSource(pcSource), 
		.nextPc(nextPc), 
		.instruction(instruction), 
		.hit(hit)
	);

	initial begin
	
		clock = 0;
		branchTarget = 0;
		pcSource = 0;
		
	end
	
	always #50 clock = ~clock;
	 
endmodule

