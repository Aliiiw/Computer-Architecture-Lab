`timescale 1ns / 1ps

module RegisterFile(clock, regWrite, writeReg, writeData, readRegisterNumberOne, readRegisterNumberTwo, readDataNumberOne, readDataNumberTwo);

	
	input clock;
	input regWrite;
	
	input [4:0]  writeReg;
	input [31:0] writeData;
	
	input [4:0] readRegisterNumberOne;
	output [31:0] readDataNumberOne;
	
	input [4:0] readRegisterNumberTwo;
	output [31:0] readDataNumberTwo;
	
	reg [31:0] registerFile [31:0];
							
	integer i;
	
	initial begin 
		for(i = 0; i < 32; i = i + 1)
			registerFile[i] = i;
	end
		
	initial registerFile[0] = 0; 					//zeroRegister = 0
	
	assign readDataNumberOne = registerFile[readRegisterNumberOne];
	assign readDataNumberTwo = registerFile[readRegisterNumberTwo];
		
		
	always @(posedge clock)						//write data 
		begin
			if (regWrite == 1)
				begin
				
				if (writeReg == 0) 												//zeroRegister Can not assign value
					$display("Can not change zero register");
				else
					registerFile[writeReg] = writeData;
					
				end		
		end

endmodule
