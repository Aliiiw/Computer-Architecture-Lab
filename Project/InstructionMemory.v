`timescale 1ns / 1ps

module InstructionMemory(instructionAddress, clock, outputInstructionMemory);
	
	input [31:0] instructionAddress;
	input clock;
	
	output reg [127:0] outputInstructionMemory;
	
	reg [7:0] memory[1023:0];
	reg [2:0] counter = 0;
	reg [31:0] index;
	reg [27:0] addressValue;
	
	//integer i;
	
	// initial begin	
	// 	counter = 0;
	// 	for (i = 0; i < 1024; i = i + 1)
	// 		begin
	// 			memory[i] = 0;
	// 		end
	// end
	
	initial begin

		//test all
		memory[0] = 'h00;
		memory[1] = 'h43;
		memory[2] = 'h08;
		memory[3] = 'h00;

		memory[4] = 'h00;
		memory[5] = 'ha6;
		memory[6] = 'h20;
		memory[7] = 'h01;

		memory[8] = 'h01;
		memory[9] = 'h09;
		memory[10] = 'h38;
		memory[11] = 'h02;

		memory[12] = 'h01;
		memory[13] = 'h6C;
		memory[14] = 'h50;
		memory[15] = 'h03;

		memory[16] = 'h01;
		memory[17] = 'hCF;
		memory[18] = 'h68;
		memory[19] = 'h04;

		memory[20] = 'h02;
		memory[21] = 'h20;
		memory[22] = 'h80;
		memory[23] = 'h07;

		memory[24] = 'h16;
		memory[25] = 'h72;
		memory[26] = 'h00;
		memory[27] = 'h04;

		memory[28] = 'h1E;
		memory[29] = 'hB4;
		memory[30] = 'h00;
		memory[31] = 'h15;

		memory[32] = 'h06;
		memory[33] = 'hF6;
		memory[34] = 'h00;
		memory[35] = 'h17;

		memory[36] = 'h03;
		memory[37] = 'h20;
		memory[38] = 'hC0;
		memory[39] = 'hC5;

		memory[40] = 'h03;
		memory[41] = 'h60;
		memory[42] = 'hD0;
		memory[43] = 'hC6;

		memory[44] = 'h12;
		memory[45] = 'h72;
		memory[46] = 'h00;
		memory[47] = 'h04;

		memory[48] = 'h18;
		memory[49] = 'h00;
		memory[50] = 'hFF;
		memory[51] = 'hF3;
	
		//test 1 OK	add $1, $2, $3
		// memory[0] = 'h00;
		// memory[1] = 'h43;
		// memory[2] = 'h08;
		// memory[3] = 'h00;

		// memory[4] = 'h00;
		// memory[5] = 'h43;
		// memory[6] = 'h08;
		// memory[7] = 'h00;

		// memory[8] = 'h00;
		// memory[9] = 'h43;
		// memory[10] = 'h08;
		// memory[11] = 'h00;

		// memory[12] = 'h00;
		// memory[13] = 'h43;
		// memory[14] = 'h08;
		// memory[15] = 'h00;

		// memory[16] = 'h00;
		// memory[17] = 'h43;
		// memory[18] = 'h08;
		// memory[19] = 'h00;



		//test 2 OK	sub $4, $5, $6
		// memory[0] = 'h00;
		// memory[1] = 'ha6;
		// memory[2] = 'h20;
		// memory[3] = 'h01;

		// memory[4] = 'h00;
		// memory[5] = 'ha6;
		// memory[6] = 'h20;
		// memory[7] = 'h01;

		// memory[8] = 'h00;
		// memory[9] = 'ha6;
		// memory[10] = 'h20;
		// memory[11] = 'h01;

		// memory[12] = 'h00;
		// memory[13] = 'ha6;
		// memory[14] = 'h20;
		// memory[15] = 'h01;

		// memory[16] = 'h00;
		// memory[17] = 'ha6;
		// memory[18] = 'h20;
		// memory[19] = 'h01;



		//test 3 OK	and $7, $8, $9
		// memory[0] = 'h01;
		// memory[1] = 'h09;
		// memory[2] = 'h38;
		// memory[3] = 'h02;

		// memory[4] = 'h01;
		// memory[5] = 'h09;
		// memory[6] = 'h38;
		// memory[7] = 'h02;

		// memory[8] = 'h01;
		// memory[9] = 'h09;
		// memory[10] = 'h38;
		// memory[11] = 'h02;

		// memory[12] = 'h01;
		// memory[13] = 'h09;
		// memory[14] = 'h38;
		// memory[15] = 'h02;

		// memory[16] = 'h01;
		// memory[17] = 'h09;
		// memory[18] = 'h38;
		// memory[19] = 'h02;




		//test 4 OK	or $10, $11, $12
		// memory[0] = 'h01;
		// memory[1] = 'h6C;
		// memory[2] = 'h50;
		// memory[3] = 'h03;

		// memory[4] = 'h01;
		// memory[5] = 'h6C;
		// memory[6] = 'h50;
		// memory[7] = 'h03;

		// memory[8] = 'h01;
		// memory[9] = 'h6C;
		// memory[10] = 'h50;
		// memory[11] = 'h03;

		// memory[12] = 'h01;
		// memory[13] = 'h6C;
		// memory[14] = 'h50;
		// memory[15] = 'h03;

		// memory[16] = 'h01;
		// memory[17] = 'h6C;
		// memory[18] = 'h50;
		// memory[19] = 'h03;



		
		//test 5 OK	slt $13, $14, $15
		// memory[0] = 'h01;
		// memory[1] = 'hCF;
		// memory[2] = 'h68;
		// memory[3] = 'h04;

		// memory[4] = 'h01;
		// memory[5] = 'hCF;
		// memory[6] = 'h68;
		// memory[7] = 'h04;

		// memory[8] = 'h01;
		// memory[9] = 'hCF;
		// memory[10] = 'h68;
		// memory[11] = 'h04;

		// memory[12] = 'h01;
		// memory[13] = 'hCF;
		// memory[14] = 'h68;
		// memory[15] = 'h04;

		// memory[16] = 'h01;
		// memory[17] = 'hCF;
		// memory[18] = 'h68;
		// memory[19] = 'h04;

		//test 6 OK 	not $16, $17   	
		// memory[0] = 'h02;
		// memory[1] = 'h20;
		// memory[2] = 'h80;
		// memory[3] = 'h07;

		// memory[4] = 'h02;
		// memory[5] = 'h20;
		// memory[6] = 'h80;
		// memory[7] = 'h07;

		// memory[8] = 'h02;
		// memory[9] = 'h20;
		// memory[10] = 'h80;
		// memory[11] = 'h07;

		// memory[12] = 'h02;
		// memory[13] = 'h20;
		// memory[14] = 'h80;
		// memory[15] = 'h07;

		// memory[16] = 'h02;
		// memory[17] = 'h20;
		// memory[18] = 'h80;
		// memory[19] = 'h07;



		// //test 7 OK sw $18, 4($19)	
		// memory[0] = 'h16;
		// memory[1] = 'h72;
		// memory[2] = 'h00;
		// memory[3] = 'h04;

		// memory[4] = 'h16;
		// memory[5] = 'h72;
		// memory[6] = 'h00;
		// memory[7] = 'h04;

		// memory[8] = 'h16;
		// memory[9] = 'h72;
		// memory[10] = 'h00;
		// memory[11] = 'h04;

		// memory[12] = 'h16;
		// memory[13] = 'h72;
		// memory[14] = 'h00;
		// memory[15] = 'h04;

		// memory[16] = 'h16;
		// memory[17] = 'h72;
		// memory[18] = 'h00;
		// memory[19] = 'h04;


		// //test 8 OK addi $20, $21, 21 		
		// memory[0] = 'h1E;
		// memory[1] = 'hB4;
		// memory[2] = 'h00;
		// memory[3] = 'h15;

		// memory[4] = 'h1E;
		// memory[5] = 'hB4;
		// memory[6] = 'h00;
		// memory[7] = 'h15;

		// memory[8] = 'h1E;
		// memory[9] = 'hB4;
		// memory[10] = 'h00;
		// memory[11] = 'h15;

		// memory[12] = 'h1E;
		// memory[13] = 'hB4;
		// memory[14] = 'h00;
		// memory[15] = 'h15;

		// memory[16] = 'h1E;
		// memory[17] = 'hB4;
		// memory[18] = 'h00;
		// memory[19] = 'h15;


		//test 9 OK slti $22, $23, 23	
		// memory[0] = 'h06;
		// memory[1] = 'hF6;
		// memory[2] = 'h00;
		// memory[3] = 'h17;

		// memory[4] = 'h06;
		// memory[5] = 'hF6;
		// memory[6] = 'h00;
		// memory[7] = 'h17;

		// memory[8] = 'h06;
		// memory[9] = 'hF6;
		// memory[10] = 'h00;
		// memory[11] = 'h17;

		// memory[12] = 'h06;
		// memory[13] = 'hF6;
		// memory[14] = 'h00;
		// memory[15] = 'h17;

		// memory[16] = 'h06;
		// memory[17] = 'hF6;
		// memory[18] = 'h00;
		// memory[19] = 'h17;


		//test 10 OK lsl $24, $25, 3	
		// memory[0] = 'h03;
		// memory[1] = 'h20;
		// memory[2] = 'hC0;
		// memory[3] = 'hC5;

		// memory[4] = 'h03;
		// memory[5] = 'h20;
		// memory[6] = 'hC0;
		// memory[7] = 'hC5;

		// memory[8] = 'h03;
		// memory[9] = 'h20;
		// memory[10] = 'hC0;
		// memory[11] = 'hC5;

		// memory[12] = 'h03;
		// memory[13] = 'h20;
		// memory[14] = 'hC0;
		// memory[15] = 'hC5;

		// memory[16] = 'h03;
		// memory[17] = 'h20;
		// memory[18] = 'hC0;
		// memory[19] = 'hC5;


		// //test 11 OK lsr $26, $27, 3 	
		// memory[0] = 'h03;
		// memory[1] = 'h60;
		// memory[2] = 'hD0;
		// memory[3] = 'hC6;

		// memory[4] = 'h03;
		// memory[5] = 'h60;
		// memory[6] = 'hD0;
		// memory[7] = 'hC6;

		// memory[8] = 'h03;
		// memory[9] = 'h60;
		// memory[10] = 'hD0;
		// memory[11] = 'hC6;

		// memory[12] = 'h03;
		// memory[13] = 'h60;
		// memory[14] = 'hD0;
		// memory[15] = 'hC6;

		// memory[16] = 'h03;
		// memory[17] = 'h60;
		// memory[18] = 'hD0;
		// memory[19] = 'hC6;


		//test 12 OK lw $18, 4($19)		
		// memory[0] = 'h12;
		// memory[1] = 'h72;
		// memory[2] = 'h00;
		// memory[3] = 'h04;

		// memory[4] = 'h12;
		// memory[5] = 'h72;
		// memory[6] = 'h00;
		// memory[7] = 'h04;

		// memory[8] = 'h12;
		// memory[9] = 'h72;
		// memory[10] = 'h00;
		// memory[11] = 'h04;

		// memory[12] = 'h12;
		// memory[13] = 'h72;
		// memory[14] = 'h00;
		// memory[15] = 'h04;

		// memory[16] = 'h12;
		// memory[17] = 'h72;
		// memory[18] = 'h00;
		// memory[19] = 'h04;



		//test 13 OK beq $0, $0, -13 	
		// memory[0] = 'h18;
		// memory[1] = 'h00;
		// memory[2] = 'hFF;
		// memory[3] = 'hF3;

		// memory[4] = 'h18;
		// memory[5] = 'h00;
		// memory[6] = 'hFF;
		// memory[7] = 'hF3;

		// memory[8] = 'h18;
		// memory[9] = 'h00;
		// memory[10] = 'hFF;
		// memory[11] = 'hF3;

		// memory[12] = 'h18;
		// memory[13] = 'h00;
		// memory[14] = 'hFF;
		// memory[15] = 'hF3;

		// memory[16] = 'h18;
		// memory[17] = 'h00;
		// memory[18] = 'hFF;
		// memory[19] = 'hF3;

		
	end
	
	
	// initial begin
	// 	outputInstructionMemory = 128'b0;
	// end
	
	 always @(posedge clock) 
		 begin
		 
			if(addressValue != instructionAddress[31:4]) 
				begin
					
					addressValue = instructionAddress[31:4];
					counter = 1;
				end
				
			else if(counter == 4)
				begin
					index = {instructionAddress[31:4] , {4'b00}};
					
					outputInstructionMemory = {
					memory[index],
					memory[index+1],
					memory[index+2],
					memory[index+3],
					memory[index+4],
					memory[index+5],
					memory[index+6],
					memory[index+7],
					memory[index+8],
					memory[index+9],
					memory[index+10],
					memory[index+11],
					memory[index+12],
					memory[index+13],
					memory[index+14],
					memory[index+15]
					} ;
					counter = 0;
				end
					
			else
				begin	
					counter = counter + 1;
				end
				
				addressValue = instructionAddress[31:4];
				
		 end

endmodule
