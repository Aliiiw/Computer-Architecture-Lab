`timescale 1ns / 1ps

module IDEXRegister(clock, hit, readDataOne, readDataTwo, immediate, registerDestination, ALUSource, memToReg, regWrite,
							 memRead, memWrite, branch, ALUOperation, RT, RD, Function, nextPC, readDataOneOut, readDataTwoOut,
							 immediateOut, registerDestinationOut, ALUSourceOut, memToRegOut, regWriteOut, memReadOut, memWriteOut,
							 branchOut, ALUOperationOut, RTOut, RDOut, FunctionOut, nextPCOut, hitOut);
							 
							 
							 input clock;
							 input hit;
							 input [31:0] readDataOne;
							 input [31:0] readDataTwo;
							 input [31:0] immediate;
							 input registerDestination;
							 input ALUSource;
							 input memToReg;
							 input regWrite;
							 input memRead;
							 input memWrite;
							 input branch;
							 input [2:0] ALUOperation;
							 input [4:0] RT;
							 input [4:0] RD;
							 input [5:0] Function;
							 input [31:0] nextPC;
					
					
							 output hitOut;
							 output reg [31:0] readDataOneOut;
							 output reg [31:0] readDataTwoOut;
							 output reg [31:0] immediateOut;
							 output reg registerDestinationOut;
							 output reg ALUSourceOut;
							 output reg memToRegOut;
							 output reg regWriteOut;
							 output reg memReadOut;
							 output reg memWriteOut;
							 output reg branchOut;
							 output reg [2:0]  ALUOperationOut;
							 output reg [4:0]  RTOut;
							 output reg [4:0]  RDOut;
							 output reg [5:0]  FunctionOut;
							 output reg [31:0] nextPCOut;
							 
									
							 assign hitOut = hit;
								
								
								always @ (negedge clock)
									begin
										if (hit) 
											begin
												readDataOneOut <= readDataOne;
												readDataTwoOut <= readDataTwo;
												immediateOut <= immediate;
												registerDestinationOut <= registerDestination;
												ALUSourceOut <= ALUSource;
												memToRegOut <= memToReg;
												regWriteOut <= regWrite;
												memReadOut <= memRead;
												memWriteOut <= memWrite;
												branchOut <= branch;
												ALUOperationOut <= ALUOperation;
												RTOut <= RT; 
												RDOut <= RD;
												FunctionOut <= Function;
												nextPCOut <= nextPC;
											end
									end
							
endmodule
