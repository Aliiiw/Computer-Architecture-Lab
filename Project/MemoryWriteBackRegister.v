`timescale 1ns / 1ps

module MemoryWriteBackRegister(clock, hit, readData, ALUResult, writeReg, regWrite, memToReg, hitOut, readDataOut,
							  ALUResultOut, writeRegOut, regWriteOut, memToRegOut);


	input clock;
	input hit;
	input [31:0] readData;
	input [31:0] ALUResult;
	input [4:0] writeReg;
	input regWrite;
	input memToReg;
	
	output hitOut;
	output reg [31:0] readDataOut = 0;
	output reg [31:0] ALUResultOut = 0;
	output reg [4:0]  writeRegOut = 0;
	output reg regWriteOut = 0;
	output reg memToRegOut = 0;
	
	assign hitOut = hit;
	
	always @(negedge clock)
		begin
			if(hit) 
				begin 
				readDataOut  = readData;
				ALUResultOut = ALUResult;
				writeRegOut  = writeReg;
				regWriteOut  = regWrite;				
				memToRegOut  = memToReg;	
				end
		end

endmodule
