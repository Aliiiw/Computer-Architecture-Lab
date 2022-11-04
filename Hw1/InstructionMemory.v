`timescale 1ns / 1ps

module InstructionMemory(address, clock, data);

	input [31:00] address;
	input clock;
	
	output reg [127:00] data;
   reg invalid;
	reg [07:00] memory [1023:0];
	reg [27:00] previousAddress;
	reg [03:00] invalidCounter;
	
	integer i;
	integer counter;
	
	

	initial begin
		invalid = 1'b1;
		counter = 1'b0;
		invalidCounter = 1'b0;
		for (i = 0; i < 1024; i = i + 1) begin
			if (counter == 64) counter = 1'b0;
			else counter = counter + 1;
			memory[i] = counter;
		end
				

	end

	always @(posedge clock or address[31:4]) begin
		if (previousAddress != address[31:4]) begin
			invalidCounter = 1'b1;
			invalid = 1'b1;
		end else if (invalidCounter != 6 && invalid == 1'b1) begin
			invalidCounter = invalidCounter + 1;
		end else if (invalidCounter == 6) begin
			invalidCounter = 1'b0;
			invalid = 1'b0;
		end

		if (invalid == 1'b1) begin
			data = 128'bx;
		end else begin
			data = {
				memory[{address[31:4]    , 4'b0000}], memory[{address[31:4]    , 4'b0001}], memory[{address[31:4]    , 4'b0010}], memory[{address[31:4]    , 4'b0011}],
				memory[{address[31:4] + 1, 4'b0100}], memory[{address[31:4] + 1, 4'b0101}], memory[{address[31:4] + 1, 4'b0110}], memory[{address[31:4] + 1, 4'b0111}],
				memory[{address[31:4] + 2, 4'b1000}], memory[{address[31:4] + 2, 4'b1001}], memory[{address[31:4] + 2, 4'b1010}], memory[{address[31:4] + 2, 4'b1011}],
				memory[{address[31:4] + 3, 4'b1100}], memory[{address[31:4] + 3, 4'b1101}], memory[{address[31:4] + 3, 4'b1110}], memory[{address[31:4] + 3, 4'b1111}]
				};
		end

		previousAddress = address[31:4];
		
	end

endmodule
