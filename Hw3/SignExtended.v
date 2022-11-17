`timescale 1ns / 1ps

module SignExtend(originValue, signExtendedValue);

	input  [15:0]  originValue;
	output [31:0]  signExtendedValue;
	
	
	assign signExtendedValue [15:0] = originValue;
	assign signExtendedValue [31:16] = {16{originValue[15]}};


endmodule
