`timescale 1ns / 1ps

module IFID(clock, nextPcInput, instructionInput, hitInput, nextPcOutput, instructionOutput, hitOutput);


	input hitInput;
	input clock;
	input [31:0] instructionInput;
	input [31:0] nextPcInput;
	
	output reg [31:0] nextPcOutput = 0;
	output reg [31:0] instructionOutput = 0;
	output hitOutput;
	
	always @(negedge clock )
	begin
			if(hitInput)
			begin
				instructionOutput = instructionInput;
				nextPcOutput = nextPcInput;
			end
	end
	
	assign hitOutput = hitInput;


endmodule
