`timescale 1ns / 1ps

module MemoryWriteBackRegister(clock, hit, readData, ALUResult, writeReg, regWrite, memToReg, hitOut, readDataOut,
							  ALUResultOut, writeRegOut, regWriteOut, memToRegOut);


	input clock;
	input hit;
	input regWrite;
	input memToReg;
	input [4:0] writeReg;
	input [31:0] readData;
	input [31:0] ALUResult;
	
	output hitOut;
	output reg regWriteOut;
	output reg memToRegOut;
	output reg [4:0]  writeRegOut;
	output reg [31:0] readDataOut;
	output reg [31:0] ALUResultOut;
	
	assign hitOut = hit;
	
	always @(negedge clock)
		begin
			if(hit) 
				begin 
					memToRegOut  <= memToReg;
					regWriteOut  <= regWrite;
					writeRegOut  <= writeReg;
					readDataOut  <= readData;
					ALUResultOut <= ALUResult;		
				end
		end

endmodule
