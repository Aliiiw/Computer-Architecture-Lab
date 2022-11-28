`timescale 1ns / 1ps

module MyMips(clock);

	input clock; 
	
														//Decode
	wire [31:0] instructionDecodeInput;
	wire [5:0]  opcodeOutput;
	wire [31:0] readDataOneOutput;
	wire [31:0] readDataTwoOutput;
	wire [31:0] signExtendedOutput;
	wire [4:0] rt;
	wire [4:0] rd;


														//Fetch
	wire [31:0] brachTargetInput;
	wire [31:0] nextPcOutput;
	wire [31:0] instructionOutput;
	wire nextPcTOIFID;
	wire pcSourceInput;
	wire hitOutput;
	
												
												
														//IF ID
	wire [31:0] instructionIFIDInput;
	wire [31:0] instructionIFIDOutput;
	wire [31:0] nextPcIFIDInput;
	wire [31:0] nextPcIFIDOutput;
	wire hitIFIDInput;
	wire hitIFIDOutput;
	
	
	
													//ControlUnit
	wire [5:0] OpcodeInput;
	wire regDestinationOutput;
	wire aluSourceOutput;
	wire memToRegOutput;
	wire regWriteOutput;
	wire memReadOutput;
	wire memWriteOutput;
	wire branchOutput;
	wire [2:0] aluOpcodeOutput; 
	
	assign nextPcIFIDInput = nextPcOutput;
	assign instructionIFIDInput = instructionOutput;
	assign hitIFIDInput = hitOutput;
	assign instructionDecodeInput = instructionIFIDOutput;
	assign opcodeInput = opcodeOutput;
	


	 Decode myMipsDecode (
    .clock(clock), 
    .instruction(instructionDecodeInput), 
    .opCode(opcodeOutput), 
    .readDataNumberOne(readDataOneOutput), 
    .readDataNumberTwo(readDataTwoOutput), 
    .signExtendedImmediate(signExtendedOutput), 
    .rt(rt), 
    .rd(rd)
    );
	
	
	Fetch myMipsFetch (
		 .clock(clock), 
		 .branchTarget(brachTargetInput), 
		 .pcSource(pcSourceInput), 
		 .nextPc(nextPcOutput), 
		 .instruction(instructionOutput), 
		 .hit(hitOutput)
		 );
		 
		 
	IFID myMipsIFID (
    .clock(clock),  
    .instructionInput(instructionIFIDInput), 
    .hitInput(hitIFIDInput),
    .nextPcInput(nextPcIFIDInput),	 
    .nextPcOutput(nextPcIFIDOutput), 
    .instructionOutput(instructionIFIDOutput), 
    .hitOutput(hitIFIDOutput)
    );
	 
	 
	 ControlUnit myMipsControlUnit (
    .opCode(opcodeInput), 
    .regDestination(regDestinationOutput), 
    .aluSource(aluSourceOutput), 
    .memToReg(memToRegOutput), 
    .regWrite(regWriteOutput), 
    .memRead(memReadOutput), 
    .memWrite(memWriteOutput), 
    .branch(branchOutput), 
    .aluOpcode(aluOpcodeOutput)
    );


endmodule
