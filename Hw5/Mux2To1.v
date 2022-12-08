`timescale 1ns / 1ps

module Mux2To1(inputOne, inputTwo, select, muxResult);

	input [31:0] inputOne;
	input [31:0] inputTwo;
	input select;
	
	output [31:0] muxResult;
	
	assign muxResult = (select) ? inputTwo : inputOne;


endmodule
