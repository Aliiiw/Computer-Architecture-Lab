`timescale 1ns / 1ps

module EXMemoryRegister(clock, hit, branchTarget, zeroFlag, ALUResult, readDataTwo, writeReg, memRead,
							  memWrite, branch, regWrite, memToReg , branchTargetOut, zeroFlagOut, ALUResultOut, 
							  readDataTwoOut, writeRegOut, memReadOut, memWriteOut, branchOut, regWriteOut,
							  memToRegOut, hitOut);

	input clock;
	input hit;
	input [31:0] branchTarget;
	input zeroFlag;
	input [31:0] ALUResult;
	input [31:0] readDataTwo;
	input [4:0]  writeReg;
	input memRead;
	input memWrite;
	input branch;
	input regWrite;
	input memToReg;

	output reg [31:0] branchTargetOut = 0;
	output reg zeroFlagOut = 0;
	output reg [31:0] ALUResultOut = 0;
	output reg [31:0] readDataTwoOut = 0;
	output reg [4:0] writeRegOut = 0;
	output reg memReadOut = 0;
	output reg memWriteOut = 0;
	output reg branchOut = 0;
	output reg regWriteOut = 0;
	output reg memToRegOut = 0;
	output hitOut;
	
	assign hitOut = hit;

	always @(negedge clock) 
		begin
		  if(hit) 
				begin 
				  branchTargetOut<= branchTarget;
				  zeroFlagOut    <= zeroFlag;
				  ALUResultOut   <= ALUResult;
				  readDataTwoOut <= readDataTwo;
				  writeRegOut    <= writeReg;
				  memReadOut     <= memRead;
				  memWriteOut    <= memWrite;
				  branchOut      <= branch;
				  regWriteOut    <= regWrite;
				  memToRegOut    <= memToReg;
				end
		end

endmodule
