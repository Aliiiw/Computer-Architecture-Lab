`timescale 1ns / 1ps

module IFID(clock, nextPcInput, instructionInput, hitInput, nextPcOutput, instructionOutput, hitOutput);


	input hitInput;
	input clock;
	input [31:0] instructionInput;
	input [31:0] nextPcInput;
	
	output reg [31:0] nextPcOutput;
	output reg [31:0] instructionOutput;
	output reg hitOutput;
	
	initial
	begin
		instructionOutput = 32'bx;
	end
	
	always @(negedge clock )
	begin
			instructionOutput = instructionInput;
			nextPcOutput = nextPcInput;
			hitOutput = hitInput;	
	end


endmodule
