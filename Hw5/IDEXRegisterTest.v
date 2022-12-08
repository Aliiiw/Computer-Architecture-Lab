`timescale 1ns / 1ps

module IDEXRegisterTest;

	// Inputs
	reg clock;
	reg hit;
	reg [31:0] readDataOne;
	reg [31:0] readDataTwo;
	reg [31:0] immediate;
	reg registerDestination;
	reg ALUSource;
	reg memToReg;
	reg regWrite;
	reg memRead;
	reg memWrite;
	reg branch;
	reg [2:0] ALUOperation;
	reg [4:0] RT;
	reg [4:0] RD;
	reg [5:0] Function;
	reg [31:0] nextPC;

	// Outputs
	wire [31:0] readDataOneOut;
	wire [31:0] readDataTwoOut;
	wire [31:0] immediateOut;
	wire registerDestinationOut;
	wire ALUSourceOut;
	wire memToRegOut;
	wire regWriteOut;
	wire memReadOut;
	wire memWriteOut;
	wire branchOut;
	wire [2:0] ALUOperationOut;
	wire [4:0] RTOut;
	wire [4:0] RDOut;
	wire [5:0] FunctionOut;
	wire [31:0] nextPCOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	IDEXRegister uut (
		.clock(clock), 
		.hit(hit), 
		.readDataOne(readDataOne), 
		.readDataTwo(readDataTwo), 
		.immediate(immediate), 
		.registerDestination(registerDestination), 
		.ALUSource(ALUSource), 
		.memToReg(memToReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.ALUOperation(ALUOperation), 
		.RT(RT), 
		.RD(RD), 
		.Function(Function), 
		.nextPC(nextPC), 
		.readDataOneOut(readDataOneOut), 
		.readDataTwoOut(readDataTwoOut), 
		.immediateOut(immediateOut), 
		.registerDestinationOut(registerDestinationOut), 
		.ALUSourceOut(ALUSourceOut), 
		.memToRegOut(memToRegOut), 
		.regWriteOut(regWriteOut), 
		.memReadOut(memReadOut), 
		.memWriteOut(memWriteOut), 
		.branchOut(branchOut), 
		.ALUOperationOut(ALUOperationOut), 
		.RTOut(RTOut), 
		.RDOut(RDOut), 
		.FunctionOut(FunctionOut), 
		.nextPCOut(nextPCOut), 
		.hitOut(hitOut)
	);

	initial begin
		// Initialize Inputs
		hit = 0;
		readDataOne = 32'b0000_0000_0000_0000_0000_0000_0000_0010;   	//2
		readDataTwo = 32'b0000_0000_0000_0000_0000_0000_0001_0001;    //17
		immediate =     32'b0000_0000_0000_0000_0000_0000_0000_1111; //15
		registerDestination = 1;
		ALUSource = 0;
		memToReg = 1;
		regWrite = 1;
		memRead = 0;
		memWrite = 0;
		branch = 1;
		ALUOperation = 3'b100;
		RT = 5'b01100;
		RD = 5'b01010;
		Function = 6'b01101;
		nextPC = 32'b0000_0000_0000_0000_0000_0000_0000_0011;  //3
		#500;
		
		hit = 1;
		readDataOne = 32'b0000_0000_0000_0000_0000_0000_0001_0111;     //23
		readDataTwo = 32'b0000_0000_0000_0000_0000_0000_0000_1010;    //10
		immediate =     32'b0000_0000_0000_0000_0000_0000_0000_1100; //12
		registerDestination = 1;
		ALUSource = 0;
		memToReg = 0;
		regWrite = 1;
		memRead = 1;
		memWrite = 0;
		branch = 1;
		ALUOperation = 3'b110;
		RT = 5'b01110;
		RD = 5'b01100;
		Function = 6'b11101;
		nextPC = 32'b0000_0000_0000_0000_0000_0000_0000_1111;  // 15
		#500;
        
		// Add stimulus here

	end
      
endmodule
