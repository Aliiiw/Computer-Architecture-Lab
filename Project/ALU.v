`timescale 1ns / 1ps

module ALU(inputOne, inputTwo, ALUControl, shiftAmount, result, zero);

	input [31:0] inputOne;
	input [31:0] inputTwo;
	input [3:0]  ALUControl;
	input [4:0]  shiftAmount;
	
	output reg [31:0] result;
	output reg zero;
	
	always @(*)
		begin
			if(ALUControl == 4'b0000)
			
				begin
					result = inputOne + inputTwo;
				end
				
			else if(ALUControl == 4'b0001)
				begin
					result = inputOne - inputTwo;
				end

			else if(ALUControl == 4'b0010)
				begin
					result = ~inputOne;
				end

			else if(ALUControl == 4'b0011)
				begin
					result = inputOne << shiftAmount;
				end
				
			else if(ALUControl == 4'b0100)
				begin
					result = inputOne >> shiftAmount;
				end
				
			else if(ALUControl == 4'b0101)
				begin
					result = inputOne & inputTwo;
				end
				
			else if(ALUControl == 4'b0110)
				begin
					result = inputOne | inputTwo;
				end
				
			else if(ALUControl == 4'b0111)
				begin
					result = (inputOne < inputTwo)? 32'b1 : 32'b0;
				end
			
			else
				begin
					result = 32'bx;
				end
		
			zero = (result == 32'b0)? 1 : 0;
		end
	
endmodule
