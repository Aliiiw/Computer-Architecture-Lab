`timescale 1ns / 1ps

module Execute(clock, ALUReadDataOne, ALUReadDataTwo, immediate, Function, ALUOperation, ALUSource, ALUResult, zero);

	input clock;
	input [31:0] ALUReadDataOne;
	input [31:0] ALUReadDataTwo;
	input [31:0] immediate;
	input [5:0]  Function;
	input [2:0]  ALUOperation;
	input ALUSource;

	output [31:0] ALUResult;
	output zero;

	
	
	wire [31:0] ALUInputDataTwo;
	
	Mux2To1 mux (
		 .inputOne(ALUReadDataTwo), 
		 .inputTwo(immediate), 
		 .select(ALUSource), 
		 .muxResult(ALUInputDataTwo)
		 );
	
	
	wire [3:0] ALUControl;
	
	ALUControlUnit ALUCU (
		 .ALUOperation(ALUOperation), 
		 .Function(Function), 
		 .ALUControl(ALUControl)
		 );
		 
		 
	wire  [4:0] ShiftAmount;
	assign ShiftAmount = 4'b1;
														
	ALU ALUInstance (
		 .inputOne(ALUReadDataOne), 
		 .inputTwo(ALUInputDataTwo), 
		 .ALUControl(ALUControl), 
		 .shiftAmount(ShiftAmount), 
		 .result(ALUResult), 
		 .zero(zero)
		 );
		 

endmodule
