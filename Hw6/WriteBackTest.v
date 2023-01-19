`timescale 1ns / 1ps

module WriteBackTest;

	// Inputs
	reg memToReg;
	reg [31:0] readData;
	reg [31:0] ALUResult;

	// Outputs
	wire [31:0] writeData;

	// Instantiate the Unit Under Test (UUT)
	WriteBack uut (
		.memToReg(memToReg), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeData(writeData)
	);

	initial begin
		
		memToReg   = 0;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_0010; 		//2
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0001_0111; 	  //23

		#100;
		
		memToReg   = 1;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_1000; 	//8
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0001_0001;   //17

	end
      
endmodule
