`timescale 1ns / 1ps

module Mux(pc, branchTarget, pcSource, address);
	
	input [31:0] pc;
	input [31:0] branchTarget;
	input pcSource;
	
	output reg[31:0]address;
	
	
	always @(pcSource or pc or branchTarget)
	      begin
			
			//address = pcSource ? branchTarget : pc;
			if (pcSource == 1)
				address = branchTarget;
			if (pcSource == 0)
				address = pc;
				  
			end

endmodule
