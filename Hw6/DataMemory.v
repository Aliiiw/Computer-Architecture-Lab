`timescale 1ns / 1ps

module DataMemory(clock, address, writeData, memWrite, memRead, readData);

	input clock;
	input [31:0] address;
	input [31:0] writeData;
	input memWrite;
	input memRead;
	
	output reg [31:0] readData;

												//1024 row 8 column
	reg [7:0] memory [1023:0];
	
	integer i;
	initial
		begin
			for(i = 0; i <= 1023; i = i + 1)
				memory[i] = i;
		end
	
	always @ (posedge clock)
		begin
			if (memRead)
				begin
				
					readData [7:0]   = memory[address];
					readData [15:8]  = memory[address + 1];
					readData [23:16] = memory[address + 2];
					readData [31:24] = memory[address + 3];
					
				end
			
			if (memWrite) 
				begin
					memory[address]   = writeData[7:0];
					memory[address + 1] = writeData[15:8];
					memory[address + 2] = writeData[23:16];
					memory[address + 3] = writeData[31:24];
					$display("After data wrote ->  memory[address] is = %b", memory[address]);
				end	
		end


endmodule
