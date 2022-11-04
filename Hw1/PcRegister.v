`timescale 1ns / 1ps

module PcRegister(

	input [31:0] address,
	input clock,
	output reg [31:0] nextAddress
	
	);
	
	always @(posedge clock) begin
		nextAddress <= address + 4;
	end
	
endmodule
