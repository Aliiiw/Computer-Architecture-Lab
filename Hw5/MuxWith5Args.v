`timescale 1ns / 1ps

module MuxWith5Args(inputOne, inputTwo, select, muxResult);

	input [4:0] inputOne;
	input [4:0] inputTwo;
	input select;
	
	output [4:0] muxResult;
	
	assign muxResult = (select) ? inputTwo : inputOne;



endmodule
