`timescale 1ns / 1ps

module ExecuteTest;

	// Inputs
	reg clock;
	reg [31:0] ALUReadDataOne;
	reg [31:0] ALUReadDataTwo;
	reg [31:0] immediate;
	reg [5:0] Function;
	reg [2:0] ALUOperation;
	reg ALUSource;

	// Outputs
	wire [31:0] ALUResult;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clock(clock), 
		.ALUReadDataOne(ALUReadDataOne), 
		.ALUReadDataTwo(ALUReadDataTwo), 
		.immediate(immediate), 
		.Function(Function), 
		.ALUOperation(ALUOperation), 
		.ALUSource(ALUSource), 
		.ALUResult(ALUResult), 
		.zero(zero)
	);
	
	initial begin
			clock = 0;
		end
	
	always #50 clock = ~clock;

	initial begin
		// Initialize Inputs
																//ADD output = 5 + 7  zero = 0
		ALUReadDataOne = 7;
		ALUReadDataTwo = 5;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100; 			//12;
		Function = 6'b000000;
		ALUOperation = 3'b000;
		ALUSource = 0;
		#100;
		
		
																//OR output = 6 | 12 zero = 0
		ALUReadDataOne = 6;
		ALUReadDataTwo = 3;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100;
		Function = 6'b000011;
		ALUOperation = 3'b000;
		ALUSource = 1;
		#100;
		
															//NOT
		ALUReadDataOne = 15;
		ALUReadDataTwo = 6;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1101; // 13
		Function = 6'b000111;
		ALUOperation = 3'b000;
		ALUSource = 0;
		#100;
		
															//SLT
		ALUReadDataOne = 19;
		ALUReadDataTwo = 12;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		Function = 6'bxxxxxx;
		ALUOperation = 3'b010;
		ALUSource = 0;
		#100;


															//LSR
		ALUReadDataOne = 13;
		ALUReadDataTwo = 15;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0100_0000;
		Function = 6'b000110;
		ALUOperation = 3'b000;
		ALUSource = 1;
		#100;

															//SUB
		ALUReadDataOne = 9;
		ALUReadDataTwo = 2;
		immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		Function = 6'b000001;
		ALUOperation = 3'b000;
		ALUSource = 1;
		#100;
		
	end
      
endmodule
