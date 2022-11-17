`timescale 1ns / 1ps

module RegisterFile(clock, writeSignal, readRegisterNumberOne, readRegisterNumberTwo, writeRegister, writeData, readDataNumberOne, readDataNumberTwo);

	
	input clock;
	input writeSignal;
	input [4:0] readRegisterNumberOne;
	input [4:0] readRegisterNumberTwo;
	input [4:0] writeRegister;
	input [31:0] writeData;
	
	
	output [31:0] readDataNumberOne;
	output [31:0] readDataNumberTwo;
	
	
	reg [31:0] registerFile [31:0];

	
	assign readDataNumberOne = registerFile[readRegisterNumberOne];
	assign readDataNumberTwo = registerFile[readRegisterNumberTwo];
	
											
	initial registerFile[0] = 0; 					//zeroRegister = 0
	
	integer i;
	
	initial  
		begin 
			for(i = 1; i < 32; i = i + 1)
				registerFile[i] = i;
		end
		
		
	always @(posedge clock) 
		begin
			if (writeSignal == 1)
				begin
				if (writeRegister == 0) 												//zeroRegister Can not assign value
					begin
						$display("%h", registerFile[writeRegister]);
						$display("You are not able to change zeroRegister Value");
						$display("%h", registerFile[writeRegister]);
					end
				else 	
					begin
						$display("%h", registerFile[writeRegister]);
						registerFile[writeRegister] = writeData;
						$display("%h", registerFile[writeRegister]);
						$display("OK");
					end
			end
			else
				begin
					$display("%h", registerFile[writeRegister]);
					$display("Access Denied");
					$display("%h", registerFile[writeRegister]);
				end
		end

endmodule
