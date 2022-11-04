`timescale 1ns / 1ps

	module Fetch(clock, branchTarget, pcSource, nextPc, instruction, hit);

	input [31:0] branchTarget;
	input wire clock;           
	input pcSource;
	
	output [31:0] nextPc;			 
	output [31:0] instruction;     
	output wire hit;   
	
	wire [127:0] data;		  
	wire [31:0] address;			
	wire [31:0] nextAddress; 	
	
	Mux mux (
		 .pc(nextPc), 
		 .branchTarget(branchTarget), 
		 .pcSource(pcSource), 
		 .address(nextAddress)
		 );
		 
	PC pc (
		.address(address), 
		.nextAddress(nextAddress), 
		.clock(clock), 
		.hit(hit)
    );
	 
	InstructionMemory instructionMemory (
		.instructionAddress(address), 
		.clock(clock), 
		.outputInstructionMemory(data)
    );

	Cache cache (
    .data(data), 
    .clock(clock), 
    .address(address), 
    .instruction(instruction), 
    .hit(hit)
    );

	
	assign nextPc = address + 4;


endmodule
