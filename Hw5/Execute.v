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
	wire [3:0] ALUControl;
	wire  [4:0] ShiftAmount;
	assign ShiftAmount = immediate[10:6];
	
	
	
	Mux2To1 mux (
		 .inputOne(ALUReadDataTwo), 
		 .inputTwo(immediate), 
		 .select(ALUSource), 
		 .muxResult(ALUInputDataTwo)
		 );
	
														//ALUControlUnit Instance
	ALUControlUnit ALUCU (
		 .ALUOperation(ALUOperation), 
		 .Function(Function), 
		 .ALUControl(ALUControl)
		 );
		 
		 
														//ALU Instance
	ALU ALUInstance (
		 .inputOne(ALUReadDataOne), 
		 .inputTwo(ALUInputDataTwo), 
		 .ALUControl(ALUControl), 
		 .shiftAmount(ShiftAmount), 
		 .result(ALUResult), 
		 .zero(zero)
		 );


endmodule
