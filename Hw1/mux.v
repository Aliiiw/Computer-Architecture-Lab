`timescale 1ns / 1ps

module mux(

	input [31:0] input1, 
	input [31:0] input2,
	input selector,
	output [31:0] out
	
	);
	
	assign out = selector ? input1 : input2;

endmodule
