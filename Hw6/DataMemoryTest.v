`timescale 1ns / 1ps

module DataMemoryTest;

	// Inputs
	reg clock;
	reg [31:0] address;
	reg [31:0] writeData;
	reg memWrite;
	reg memRead;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clock(clock), 
		.address(address), 
		.writeData(writeData), 
		.memWrite(memWrite), 
		.memRead(memRead), 
		.readData(readData)
	);

	initial begin
	
		clock = 0;

		address = 32'b0000_0000_0000_0000_0000_0000_0001_0001;          //17
		writeData = 0;
		memWrite =  0;
		memRead =   1;

		#100;
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1010; 	 //10
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0111; 	//7
		memWrite  = 1;
		memRead   = 1;
		
		#100;
		
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1100; 	//12
		writeData = 32'b0000_0000_0000_0000_0000_0000_0001_0111;   //23
		memWrite  = 0;
		memRead   = 1;
		
		#100;
				
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1111; 	 //15
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_1010; 	//10
		memWrite  = 1;
		memRead   = 0;
		
		#100;
				
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1100;    //12
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		memWrite  = 0;
		memRead   = 1;
        
	end

	always #50 clock = ~clock;
      
endmodule
