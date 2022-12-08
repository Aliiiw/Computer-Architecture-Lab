`timescale 1ns / 1ps

module ALUTest;

	// Inputs
	reg [31:0] inputOne;
	reg inputTwo;
	reg [3:0] ALUControl;
	reg [4:0] shiftAmount;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inputOne(inputOne), 
		.inputTwo(inputTwo), 
		.ALUControl(ALUControl), 
		.shiftAmount(shiftAmount), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
										//ADD zero = 0
		inputOne = 4;
		inputTwo = 8;
		ALUControl = 4'b0000;
		shiftAmount = 5'b0110;  //Don't Care
		
		#200;

										//NOT Zero = 0
		inputOne = 3; 
		inputTwo = 9;						  
		ALUControl = 4'b0010;
		shiftAmount = 5'b0100;  //Don't Care
		
		#200;
		
										//LSR zero = 0
		inputOne = 10; 
		inputTwo = 12;           //Don't Care
		ALUControl = 4'b0100;
		shiftAmount = 5'b00010;
		
		#200;
		
										//SLT zero = 1
		inputOne = 17;
		inputTwo = 2;
		ALUControl = 4'b0111;
		shiftAmount = 5'b0110;      //Don't Care


	end
      
endmodule

