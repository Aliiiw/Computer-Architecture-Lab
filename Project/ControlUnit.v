`timescale 1ns / 1ps

module ControlUnit(opCode, regDestination, aluSource, memToReg, regWrite, memRead, memWrite, branch, aluOpcode);

	
	input [5:0] opCode;

	output reg regDestination;
	output reg aluSource;
	output reg memToReg;
	output reg regWrite;
	output reg memRead;
	output reg memWrite;
	output reg branch;
	output reg [2:0] aluOpcode;
	
	always @ (opCode) begin
			
			assign regDestination = 0;
			assign aluSource = 0;
			assign memToReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOpcode = 000;

		if (opCode == 6'b000000) begin 										// R-type
			assign regDestination = 1;
			assign aluSource = 0;
			assign memToReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOpcode = 000;
		end
		if (opCode == 6'b000100) begin 										// lw
			assign regDestination = 0;
			assign aluSource = 1;
			assign memToReg = 1;
			assign regWrite = 1;
			assign memRead = 1;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOpcode = 011;
		end
		if (opCode == 6'b000101) begin 										// sw
			assign regDestination = 0;
			assign aluSource = 1;
			assign memToReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 1;
			assign branch = 0;
			assign aluOpcode = 011;
		end
		if (opCode == 6'b000111) begin 									// addi
			assign regDestination = 0;
			assign aluSource = 1;
			assign memToReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOpcode = 011;
		end
		if (opCode == 6'b000110) begin 									// beq
			assign regDestination = 0;
			assign aluSource = 0;
			assign memToReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 1;
			assign aluOpcode = 001;
		end
		if (opCode == 6'b000001) begin 									// slti
			assign regDestination = 0;
			assign aluSource = 1;
			assign memToReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOpcode = 010;
		end
	end
	
	
	
endmodule
