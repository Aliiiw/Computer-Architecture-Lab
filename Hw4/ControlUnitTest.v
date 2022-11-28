`timescale 1ns / 1ps

module ControlUnitTest;

	// Inputs
	reg [5:0] opCode;

	// Outputs
	wire regDestination;
	wire aluSource;
	wire memToReg;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire branch;
	wire [2:0] aluOpcode;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opCode(opCode), 
		.regDestination(regDestination), 
		.aluSource(aluSource), 
		.memToReg(memToReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.aluOpcode(aluOpcode)
	);

	initial begin
	
		opCode = 6'b000000;
		#100;
		
		opCode = 6'b000100;
		#100;
		
		opCode = 6'b000101;
		#100;
		
		opCode = 6'b000111;
		#100;
		
		opCode = 6'b000110;
		#100;
		
		opCode = 6'b111111;
		#100;
		
		opCode = 6'b000010;
		
	end
      
endmodule

