`timescale 1ns / 1ps

module MemoryWriteBackRegisterTest;

	// Inputs
	reg clock;
	reg hit;
	reg [31:0] readData;
	reg [31:0] ALUResult;
	reg [4:0] writeReg;
	reg regWrite;
	reg memToReg;

	// Outputs
	wire hitOut;
	wire [31:0] readDataOut;
	wire [31:0] ALUResultOut;
	wire [4:0] writeRegOut;
	wire regWriteOut;
	wire memToRegOut;

	// Instantiate the Unit Under Test (UUT)
	MemoryWriteBackRegister uut (
		.clock(clock), 
		.hit(hit), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeReg(writeReg), 
		.regWrite(regWrite), 
		.memToReg(memToReg), 
		.hitOut(hitOut), 
		.readDataOut(readDataOut), 
		.ALUResultOut(ALUResultOut), 
		.writeRegOut(writeRegOut), 
		.regWriteOut(regWriteOut), 
		.memToRegOut(memToRegOut)
	);
	
	initial begin
		clock = 0;

		hit = 0;
		readData  = 5'b01110;
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0000_0010; //2
		writeReg  = 0;
		regWrite  = 0;
		memToReg  = 1;

		#500;
		
		hit = 1;
		readData  = 5'b10100;
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0001_0001; //17
		writeReg  = 0;
		regWrite  = 1;
		memToReg  = 0;
        
	end
	
	always #250 clock = ~clock;
      
endmodule

