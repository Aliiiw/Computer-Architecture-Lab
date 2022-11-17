`timescale 1ns / 1ps

module RegisterFileTest;

	// Inputs
	reg clock;
	reg writeSignal;
	reg [4:0] readRegisterNumberOne;
	reg [4:0] readRegisterNumberTwo;
	reg [4:0] writeRegister;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] readDataNumberOne;
	wire [31:0] readDataNumberTwo;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.clock(clock), 
		.writeSignal(writeSignal), 
		.readRegisterNumberOne(readRegisterNumberOne), 
		.readRegisterNumberTwo(readRegisterNumberTwo), 
		.writeRegister(writeRegister), 
		.writeData(writeData), 
		.readDataNumberOne(readDataNumberOne), 
		.readDataNumberTwo(readDataNumberTwo)
	);

	
		
	always #50	clock = ~clock;
		
	initial begin
		// Initialize Inputs
		clock = 0;
	   readRegisterNumberOne = 10;
		readRegisterNumberTwo = 9;
		writeRegister = 4;
		writeSignal = 1;
		writeData = 70;
		#100;
		
	   readRegisterNumberOne = 7;
		readRegisterNumberTwo = 11;
		writeRegister = 0;
		writeSignal = 1;
		writeData = 80;
		#100;
		
		
	   readRegisterNumberOne = 23;
		readRegisterNumberTwo = 21;
		writeRegister = 1;
		writeSignal = 0;
		writeData = 90;
		#100;

	end
      
endmodule

