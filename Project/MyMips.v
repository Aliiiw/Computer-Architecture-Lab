`timescale 1ns / 1ps

module MyMips(clock);

	input clock; 
	wire hitForAll;
 	// register wait vaghfe ALAKI


															//Decode  Done
	wire [31:0] instructionInputDecode;
	wire [5:0]  opcodeOutputDecode;
	wire [31:0] readDataOneOutputDecode;
	wire [31:0] readDataTwoOutputDecode;
	wire [31:0] signExtendedOutputDecode;
	wire [4:0] rtDecode;
	wire [4:0] rdDecode;
	
	
															//IF ID  Done
	//wire hitInputIFID;
	wire [31:0] nextPcInputIFID;
	wire [31:0] instructionInputIFID;
	//wire hitOutputIFID;
	wire [31:0] nextPcOutputIFID;
	wire [31:0] instructionOutputIFID;
	
	
															//ControlUnit  Done
	wire [5:0] OpcodeInputCU;
	wire regDestinationCU;
	wire ALUSourceCU;
	wire memToRegCU;
	wire regWriteCU;
	wire memReadCU;
	wire memWriteCU;
	wire branchCU;
	wire [2:0] ALUOpcodeCU;
	
	
															//ID EX  Done
	//wire hitOutIDEX;
	wire [31:0] readDataOneIDEX;
	wire [31:0] readDataTwoIDEX;
	wire [31:0] immediateIDEX;
	wire registerDestinationIDEX;
	wire ALUSourceIDEX;
	wire memToRegIDEX;
	wire regWriteIDEX;
	wire memReadIDEX;
	wire memWriteIDEX;
	wire branchIDEX;
	wire [2:0] ALUOperationIDEX;
	wire [4:0] rtIDEX;
	wire [4:0] rdIDEX;
	wire [5:0] FunctionIDEX;
	wire [31:0] nextPCIDEX;


															//Fetch  Done
	//wire hitFetch; 
	wire [31:0] instructionFetch;
	wire [31:0] nextPCFetch;
	wire pcSourceDataMemory;
	
	
															//Execute  Done
	wire [31:0] ALUResultExecute;
	wire zeroExecute;
	wire [31:0] branchTargetExecute;
	wire [4:0] muxOutputExecute;
	
	
															//EX MEM   Done
	//wire hitEXMEM;
	wire [31:0] branchTargetEXMEM;
	wire zeroFlagEXMEM;
	wire [31:0] ALUResultEXMEM;
	wire [31:0] readDataTwoEXMEM;
	wire [4:0] writeRegEXMEM;
	wire memReadEXMEM;
	wire memWriteEXMEM;
	wire branchEXMEM;
	wire regWriteEXMEM;
	wire memToRegEXMEM;



	
	
															//Data Memory  Done
	wire [31:0] readDataForDataMemory;
	
	
															//Memory Write Back  Done 
	wire [31:0] readDataMEMWB;
	wire [31:0] ALUResultMEMWB;
	wire [4:0] writeRegMEMWB;
	wire regWriteMEMWB;
	wire memToRegMEMWB;
	//wire hitMEMWB;
	
	
															//Write Back  Done 
	wire [31:0] writeDataWB;
	
	
	//Let's Make Bridge Dude
	
	//Fetch
	assign pcSourceDataMemory = (branchEXMEM === 1'bx || zeroFlagEXMEM === 1'bx) ? 0 : branchEXMEM & zeroFlagEXMEM;
	
	
	Fetch myMipsFetch (
		 .clock(clock), 
		 .branchTarget(branchTargetEXMEM), 
		 .pcSource(pcSourceDataMemory), 

		 .hit(hitForAll),
		 .instruction(instructionFetch),
		 .nextPc(nextPCFetch)
		 );
		 
	
	//IF ID
	assign instructionInputIFID = instructionFetch;
	assign nextPcInputIFID = nextPCFetch;
	//assign hitInputIFID = hitFetch;
	
	IFID myMipsIFID (
    .clock(clock), 
	.hitInput(hitForAll),	
	.nextPcInput(nextPcInputIFID),	 
    .instructionInput(instructionInputIFID),

	.hitOutput(),
    .nextPcOutput(nextPcOutputIFID), 
    .instructionOutput(instructionOutputIFID)
    );
	 
	 
	 //Decode
	assign instructionInputDecode = instructionOutputIFID;
	 
	Decode myMipsDecode (
    .clock(clock), 
	.instruction(instructionInputDecode), 
	.regWrite(regWriteMEMWB),
	.writeReg(writeRegMEMWB),
	.writeData(writeDataWB),

	.opCode(opcodeOutputDecode), 
	.readDataNumberOne(readDataOneOutputDecode), 
	.readDataNumberTwo(readDataTwoOutputDecode), 
	.signExtendedImmediate(signExtendedOutputDecode), 
	.rt(rtDecode), 
	.rd(rdDecode)
    );
	 
	 
	 //CU
	 assign OpcodeInputCU = opcodeOutputDecode;
	 
	 ControlUnit myMipsControlUnit (
    .opCode(OpcodeInputCU), 
    .regDestination(regDestinationCU), 
    .aluSource(ALUSourceCU), 
    .memToReg(memToRegCU), 
    .regWrite(regWriteCU), 
    .memRead(memReadCU), 
    .memWrite(memWriteCU), 
    .branch(branchCU), 
    .aluOpcode(ALUOpcodeCU)
    );
	 
	 
	 //ID EX      
	 
	 IDEXRegister myMipsIDEX (
		 .clock(clock), 
		 .hit(hitForAll), 
		 .readDataOne(readDataOneOutputDecode), 
		 .readDataTwo(readDataTwoOutputDecode), 
		 .immediate(signExtendedOutputDecode), 
		 .hitOut(),
		 .readDataOneOut(readDataOneIDEX), 
		 .readDataTwoOut(readDataTwoIDEX),
		 .immediateOut(immediateIDEX),
		 .registerDestination(regDestinationCU), 
		 .ALUSource(ALUSourceCU), 
		 .memToReg(memToRegCU), 
		 .regWrite(regWriteCU), 
		 .memRead(memReadCU), 
		 .memWrite(memWriteCU), 
		 .branch(branchCU), 
		 .ALUOperation(ALUOpcodeCU),
		 .registerDestinationOut(registerDestinationIDEX), 
		 .ALUSourceOut(ALUSourceIDEX), 
		 .memToRegOut(memToRegIDEX), 
		 .regWriteOut(regWriteIDEX), 
		 .memReadOut(memReadIDEX), 
		 .memWriteOut(memWriteIDEX), 
		 .branchOut(branchIDEX), 
		 .ALUOperationOut(ALUOperationIDEX), 
		 .RT(rtDecode), 
		 .RD(rdDecode), 
		 .Function(signExtendedOutputDecode[5:0]), 
		 .nextPC(nextPcOutputIFID), 
		 .RTOut(rtIDEX), 
		 .RDOut(rdIDEX), 
		 .FunctionOut(FunctionIDEX), 
		 .nextPCOut(nextPCIDEX)
		 );
		 
	//Branch
	assign branchTargetExecute = (immediateIDEX << 2) + nextPCIDEX;
	
	//Mux 5 bit
	assign muxOutputExecute = (registerDestinationIDEX) ? rdIDEX : rtIDEX;

	 Execute myMipsExecute (
		 .clock(clock), 
		 .ALUReadDataOne(readDataOneIDEX), 
		 .ALUReadDataTwo(readDataTwoIDEX), 
		 .immediate(immediateIDEX), 
		 .Function(FunctionIDEX), 
		 .ALUOperation(ALUOperationIDEX), 
		 .ALUSource(ALUSourceIDEX), 
		 .ALUResult(ALUResultExecute), 
		 .zero(zeroExecute)
		 );


	reg [31:0] readDataTwoExecuteEXMEMWait;   //here
	reg memReadIDEXEXMEMWait;
	reg memWriteIDEXEXMEMWait;
	reg branchIDEXEXMEMWait;
	reg regWriteIDEXEXMEMWait;
	reg memToRegIDEXEXMEMWait;


	always @(posedge clock) begin
		readDataTwoExecuteEXMEMWait = readDataTwoEXMEM;
		memReadIDEXEXMEMWait = memReadIDEX;
		memWriteIDEXEXMEMWait = memWriteIDEX;
		branchIDEXEXMEMWait = branchIDEX;
		regWriteIDEXEXMEMWait = regWriteIDEX;
		memToRegIDEXEXMEMWait = memToRegIDEX;

	end 
		 
		 

		EXMemoryRegister myMipsEXMemoryRegister (
		.clock(clock), 
		.hit(hitForAll), 
		.branchTarget(branchTargetExecute), 
		.zeroFlag(zeroExecute), 
		.ALUResult(ALUResultExecute), 
		.writeReg(muxOutputExecute),
		.readDataTwo(readDataTwoExecuteEXMEMWait),
		.memRead(memReadIDEXEXMEMWait), 
		.memWrite(memWriteIDEXEXMEMWait), 
		.branch(branchIDEXEXMEMWait), 
		.regWrite(regWriteIDEXEXMEMWait), 
		.memToReg(memToRegIDEXEXMEMWait), 

		.branchTargetOut(branchTargetEXMEM), 
		.zeroFlagOut(zeroFlagEXMEM), 
		.ALUResultOut(ALUResultEXMEM), 
		.readDataTwoOut(readDataTwoEXMEM), 
		.writeRegOut(writeRegEXMEM), 
		.memReadOut(memReadEXMEM), 
		.memWriteOut(memWriteEXMEM), 
		.branchOut(branchEXMEM), 
		.regWriteOut(regWriteEXMEM), 
		.memToRegOut(memToRegEXMEM), 
		.hitOut()
	);
	
	
	DataMemory myMipsDataMemory (
		.clock(clock), 
		.address(ALUResultEXMEM), 
		.writeData(readDataTwoEXMEM), 
		.memWrite(memWriteEXMEM), 
		.memRead(memReadEXMEM),
		.readData(readDataForDataMemory)
	);
	
	
	MemoryWriteBackRegister myMipsMemoryWriteBackRegister (
		.clock(clock), 
		.hit(hitForAll), 
		.readData(readDataForDataMemory), 
		.ALUResult(ALUResultEXMEM), 
		.writeReg(writeRegEXMEM), 
		.regWrite(regWriteEXMEM), 
		.memToReg(memToRegEXMEM), 
		.hitOut(), 
		.readDataOut(readDataMEMWB), 
		.ALUResultOut(ALUResultMEMWB), 
		.writeRegOut(writeRegMEMWB), 
		.regWriteOut(regWriteMEMWB), 
		.memToRegOut(memToRegMEMWB)
	);
	
	
	WriteBack myMipsWriteBack (
		.memToReg(memToRegMEMWB), 
		.readData(readDataMEMWB), 
		.ALUResult(ALUResultMEMWB), 
		.writeData(writeDataWB)
	);

	

	
endmodule
