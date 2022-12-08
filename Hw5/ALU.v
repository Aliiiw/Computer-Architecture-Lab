`timescale 1ns / 1ps

module ALU(inputOne, inputTwo, ALUControl, shiftAmount, result, zero);

	input [31:0] inputOne;
	input [31:0] inputTwo;
	input [3:0]  ALUControl;
	input [4:0]  shiftAmount;
	
	output reg [31:0] result;
	output reg zero;
	
	always @(ALUControl)
		begin
			if(ALUControl == 4'b0000)
			
				begin
					assign result = inputOne + inputTwo;
				end
				
			else if(ALUControl == 4'b0001)
				begin
					assign result = inputOne - inputTwo;
				end

			else if(ALUControl == 4'b0010)
				begin
					assign result = ~inputOne;
				end

			else if(ALUControl == 4'b0011)
				begin
					assign result = inputOne << shiftAmount;
				end
				
			else if(ALUControl == 4'b0100)
				begin
					assign result = inputOne >> shiftAmount;
				end
				
			else if(ALUControl == 4'b0101)
				begin
					assign result = inputOne & inputTwo;
				end
				
			else if(ALUControl == 4'b0110)
				begin
					assign result = inputOne | inputTwo;
				end
				
			else if(ALUControl == 4'b0111)
				begin
					assign result = (inputOne < inputTwo)? 32'b1 : 32'b0;
				end
			
			else
				begin
					assign result = 32'bx;
				end
		
			assign zero = (result == 32'b0)? 1 : 0;
		end
	
endmodule
