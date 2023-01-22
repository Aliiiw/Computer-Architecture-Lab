`timescale 1ns / 1ps

module DataMemory(clock, address, writeData, memWrite, memRead, readData);

	input clock;
	input [31:0] address;
	input [31:0] writeData;
	input memWrite;
	input memRead;
	
	output reg [31:0] readData = 0;

	//1024 row 32 column
	reg [31:0] memory [1023:0];
	

	always @ (posedge clock)
		begin
        if (memWrite == 1) 
			memory[address] = writeData [31:0];
			
		if (memRead == 1) 
			readData [31:0] = memory[address];
		end

endmodule
