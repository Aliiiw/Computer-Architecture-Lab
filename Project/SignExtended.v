`timescale 1ns / 1ps

module SignExtend(originValue, signExtendedValue);

	input  [15:0]  originValue;
	output [31:0]  signExtendedValue;
	
	
	assign signExtendedValue = {{16{originValue[15]}}, originValue[15:0]};


endmodule
