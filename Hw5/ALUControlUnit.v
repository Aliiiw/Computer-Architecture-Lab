`timescale 1ns / 1ps

module ALUControlUnit(ALUOperation, Function, ALUControl);

	input [2:0]  ALUOperation;
	input [5:0]  Function;
	
	output reg [3:0] ALUControl;
	
	
	always @(ALUOperation or Function)
		begin
			if(ALUOperation == 3'b000)
			
				begin
				
					if(Function == 6'b000000)
						begin
							assign ALUControl = 4'b0000;  		//ADD
						end
					else if(Function == 6'b000001)
						begin
							assign ALUControl = 4'b0001;  		//SUB
						end
					else if(Function == 6'b000010)
						begin
							assign ALUControl = 4'b0101;  		//AND
						end
					else if(Function == 6'b000011)
						begin
							assign ALUControl = 4'b0110;  		//OR
						end
					else if(Function == 6'b000100)
						begin
							assign ALUControl = 4'b0111;  		//SLT
						end
					else if(Function == 6'b000101)
						begin
							assign ALUControl = 4'b0011;  		//LSL
						end
					else if(Function == 6'b000110)
						begin
							assign ALUControl = 4'b0100;  		//LSR
						end
					else if(Function == 6'b000111)
						begin
							assign ALUControl = 4'b0010;  		//NOT
						end
				end
				
			else if(ALUOperation == 3'b001)
				begin
					assign ALUControl = 4'b0001;  				//BEQ SUB
				end
			
			else if(ALUOperation == 3'b010)
				begin
					assign ALUControl = 4'b0111;  				//SLTI SLT
				end
			
			else if(ALUOperation == 3'b011)
				begin
					assign ALUControl = 4'b0000;  				//ADDI LW SW  ADD
				end
		end

endmodule
