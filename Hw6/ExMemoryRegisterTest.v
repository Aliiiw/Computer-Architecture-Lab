`timescale 1ns / 1ps

module ExMemoryRegisterTest;

	// Inputs
	reg clock;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg [31:0] ALUResult;
	reg [31:0] readDataTwo;
	reg [4:0] writeReg;
	reg memRead;
	reg memWrite;
	reg branch;
	reg regWrite;
	reg memToReg;

	// Outputs
	wire [31:0] branchTargetOut;
	wire zeroFlagOut;
	wire [31:0] ALUResultOut;
	wire [31:0] readDataTwoOut;
	wire [4:0] writeRegOut;
	wire memReadOut;
	wire memWriteOut;
	wire branchOut;
	wire regWriteOut;
	wire memToRegOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	ExMemoryRegister uut (
		.clock(clock), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.ALUResult(ALUResult), 
		.readDataTwo(readDataTwo), 
		.writeReg(writeReg), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.regWrite(regWrite), 
		.memToReg(memToReg), 
		.branchTargetOut(branchTargetOut), 
		.zeroFlagOut(zeroFlagOut), 
		.ALUResultOut(ALUResultOut), 
		.readDataTwoOut(readDataTwoOut), 
		.writeRegOut(writeRegOut), 
		.memReadOut(memReadOut), 
		.memWriteOut(memWriteOut), 
		.branchOut(branchOut), 
		.regWriteOut(regWriteOut), 
		.memToRegOut(memToRegOut), 
		.hitOut(hitOut)
	);

	
	initial begin

		clock = 0;
		hit = 0;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_0000_0111; // 7
		zeroFlag 	 = 0;
		ALUResult 	 = 32'b0000_0000_0000_0000_0000_0000_0000_0101; // 5
		readDataTwo  = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		writeReg     = 5'b10010;
		memRead      = 0;
		memWrite     = 1;
		branch       = 1;
		regWrite     = 0;
		memToReg     = 1;

		#500;
		
		hit = 1;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_0000_1111; // 15
		zeroFlag     = 0;
		ALUResult    = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 10
		readDataTwo  = 32'b0000_0000_0000_0000_0000_0000_0000_1101; // 13
		writeReg     = 5'b10101;
		memRead      = 1;
		memWrite     = 1;
		branch       = 0;
		regWrite     = 1;
		memToReg     = 0;
        
	end
	
	always # 250 clock = ~clock;

      
endmodule
