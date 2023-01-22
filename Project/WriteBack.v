`timescale 1ns / 1ps

module WriteBack(memToReg, readData, ALUResult, writeData);

	input memToReg;
	input [31:0] readData;
	input [31:0] ALUResult;

	output reg [31:0] writeData;         //Ba Mux ham mishod farghi nadare
	
	always @(*)
		begin 
			if (memToReg == 1)
				writeData = readData;
			else
				writeData = ALUResult;
		end
	
endmodule
