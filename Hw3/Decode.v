`timescale 1ns / 1ps

module Decode(clock, instruction, opCode, readDataNumberOne, readDataNumberTwo, signExtendedImmediate, rt, rd);


   input clock;
	input[31:0]instruction;
	
	output reg [5:0] opCode;
	output reg [31:0] readDataNumberOne;
	output reg [31:0] readDataNumberTwo;
	output reg [31:0] signExtendedImmediate;
	output reg[4:0] rt;
	output reg[4:0] rd;
	
	reg  [5:0] _opCode;
	reg  [4:0] _rs;
	reg  [4:0] _rt;
	reg  [4:0] _rd;
	reg  [15:0] _immediateValue;
	wire [31:0] _signExtendValue;
	
	wire writeSignal;
	assign writeSignal = 1;
	
	wire [31:0] _readDataNumberOne;
	wire [31:0] _readDataNumberTwo;
	
	wire   writeData;
	assign writeData = 5;
	
	wire writeRegister;
	
	always @(posedge clock)
		begin
			 _opCode = instruction[31:26];
			 _rs = instruction[25:21];
			 _rt = instruction[20:16];
			 _rd = instruction[15:11];
			 _immediateValue = instruction[15:0];
			 
		end


	RegisterFile registerFile (
		 .clock(clock), 
		 .writeSignal(writeSignal), 
		 .readRegisterNumberOne(_rs), 
		 .readRegisterNumberTwo(_rt), 
		 .writeRegister(_rd), 
		 .writeData(writeData), 
		 .readDataNumberOne(_readDataNumberOne), 
		 .readDataNumberTwo(_readDataNumberTwo)
		 );


	SignExtend signExtended (
		.originValue(_immediateValue), 
		.signExtendedValue(_signExtendValue)
		);

	 
	always @(posedge clock) 
		begin 
			opCode = _opCode;
			signExtendedImmediate = _signExtendValue;
			rt = _rt;
			rd = _rd;
			readDataNumberOne = _readDataNumberOne;
			readDataNumberTwo = _readDataNumberTwo;
		end


endmodule
