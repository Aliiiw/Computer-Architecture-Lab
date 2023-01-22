`timescale 1ns / 1ps

module Decode(clock, instruction, regWrite, writeReg, writeData, opCode, readDataNumberOne, readDataNumberTwo, signExtendedImmediate, rt, rd);


   input clock;
	input [31:0] instruction;
	input regWrite;
	input [4:0]  writeReg;
	input [31:0] writeData;
	
	output reg [5:0] opCode = 0;
	output reg [31:0] readDataNumberOne = 0;
	output reg [31:0] readDataNumberTwo = 0;
	output reg [31:0] signExtendedImmediate = 0;
	output reg [4:0] rt = 0;
	output reg [4:0] rd = 0;
	
	reg  [5:0] OP;
	reg  [4:0] RS;
	reg  [4:0] RT;
	reg  [4:0] RD;
	reg  [15:0] IMMValue;
	
	always @(posedge clock)
		begin
			 RS = instruction[25:21];
			 RT = instruction[20:16];
			 RD = instruction[15:11];
			 IMMValue = instruction[15:0];
		end
		
		

	wire [31:0] _readDataOne;
	wire [31:0] _readDataTwo;
	
	RegisterFile registerFile (
		 .clock(clock), 
		 .regWrite(regWrite), 
		 .writeReg(writeReg),
		 .writeData(writeData),
		 .readRegisterNumberOne(RS),
		 .readDataNumberOne(_readDataOne),
		 .readRegisterNumberTwo(RT),
		 .readDataNumberTwo(_readDataTwo)
		 );
		 

	wire [31:0] _signExtendValue;
	
	SignExtend signExtended (
		.originValue(IMMValue), 
		.signExtendedValue(_signExtendValue)
		);

	 
	always @(posedge clock) 
		begin 
			opCode = instruction[31:26];
			readDataNumberOne = _readDataOne;
			readDataNumberTwo = _readDataTwo;
			signExtendedImmediate = _signExtendValue;
			rt = RT;
			rd = RD;
			
		end


endmodule
