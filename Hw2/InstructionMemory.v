`timescale 1ns / 1ps

module InstructionMemory(instructionAddress, clock, outputInstructionMemory);
	
	input [31:0] instructionAddress;
	input clock;
	
	output reg [127:0]outputInstructionMemory;
	
	reg [7:0]memory[1023:0];
	reg [2:0] counter = 0;
	reg [31:0] index;
	reg [27:0] addressValue;
	
	integer i;
	
	initial begin	
		counter = 0;
		for (i = 0; i < 1024; i = i + 1)
			begin
				memory[i] = i;
			end
	end
	
	
	initial begin
		outputInstructionMemory = 128'b0;
	end
	
	 always @(posedge clock) 
		 begin
		 
			if(addressValue != instructionAddress[31:4]) 
				begin
					
					addressValue = instructionAddress[31:4];
					counter = 1;
				end
				
			else if(counter == 4)
				begin
					index = {instructionAddress[31:4] , {4'b00}};
					
					outputInstructionMemory = {
					memory[index+15],
					memory[index+14],
					memory[index+13],
					memory[index+12],
					memory[index+11],
					memory[index+10],
					memory[index+9],
					memory[index+8],
					memory[index+7],
					memory[index+6],
					memory[index+5],
					memory[index+4],
					memory[index+3],
					memory[index+2],
					memory[index+1],
					memory[index]
					} ;
					counter = 0;
				end
					
			else
				begin	
					counter = counter + 1;
				end
				
				addressValue = instructionAddress[31:4];
				
		 end

endmodule
