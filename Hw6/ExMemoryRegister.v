`timescale 1ns / 1ps

module ExMemoryRegister(clock, hit, branchTarget, zeroFlag, ALUResult, readDataTwo, writeReg, memRead,
							  memWrite, branch, regWrite, memToReg , branchTargetOut, zeroFlagOut, ALUResultOut, 
							  readDataTwoOut, writeRegOut, memReadOut, memWriteOut, branchOut, regWriteOut,
							  memToRegOut, hitOut);

	input clock;
	input hit;
	input zeroFlag;
	input memRead;
	input memWrite;
	input branch;
	input regWrite;
	input memToReg;
	input [31:0] branchTarget;
	input [31:0] ALUResult;
	input [31:0] readDataTwo;
	input [4:0]  writeReg;
	

	output reg zeroFlagOut;
	output reg memReadOut;
	output reg memWriteOut;
	output reg branchOut;
	output reg regWriteOut;
	output reg memToRegOut;
	output reg [31:0] branchTargetOut;
	output reg [31:0] ALUResultOut;
	output reg [31:0] readDataTwoOut;
	output reg [4:0] writeRegOut;
	output hitOut;
	
	assign hitOut = hit;

	always @(negedge clock) 
		begin
		  if(hit) 
				begin 
				  writeRegOut    <= writeReg;
				  branchTargetOut<= branchTarget;
				  ALUResultOut   <= ALUResult;
				  readDataTwoOut <= readDataTwo;
				  zeroFlagOut    <= zeroFlag;
				  memReadOut     <= memRead;
				  memWriteOut    <= memWrite;
				  branchOut      <= branch;
				  regWriteOut    <= regWrite;
				  memToRegOut    <= memToReg;
				end
		end

endmodule
