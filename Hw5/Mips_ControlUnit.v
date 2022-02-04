`timescale 1ns / 1ps


module Mips_ControlUnit(opCode, regDst, aluSrc, memtoReg, regWrite, memRead, memWrite, branch, aluOp);

	/* According THe document Project : */
	input [5:0] opCode;

	output reg regDst;
	output reg aluSrc;
	output reg memtoReg;
	output reg regWrite;
	output reg memRead;
	output reg memWrite;
	output reg branch;
	output reg [2:0] aluOp;
	
	always @ (opCode) begin
			/* Initial Value */
			assign regDst = 0;
			assign aluSrc = 0;
			assign memtoReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 000;

		if (opCode == 6'b000000) begin // R-type
			assign regDst = 1;
			assign aluSrc = 0;
			assign memtoReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 000;
		end
		if (opCode == 6'b000100) begin // lw
			assign regDst = 0;
			assign aluSrc = 1;
			assign memtoReg = 1;
			assign regWrite = 1;
			assign memRead = 1;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 011;
		end
		if (opCode == 6'b000101) begin //sw
			assign regDst = 0;
			assign aluSrc = 1;
			assign memtoReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 1;
			assign branch = 0;
			assign aluOp = 011;
		end
		if (opCode == 6'b000111) begin // addi
			assign regDst = 0;
			assign aluSrc = 1;
			assign memtoReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 011;
		end
		if (opCode == 6'b000110) begin // beq
			assign regDst = 0;
			assign aluSrc = 0;
			assign memtoReg = 0;
			assign regWrite = 0;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 1;
			assign aluOp = 001;
		end
		if (opCode == 6'b000001) begin // slti
			assign regDst = 0;
			assign aluSrc = 1;
			assign memtoReg = 0;
			assign regWrite = 1;
			assign memRead = 0;
			assign memWrite = 0;
			assign branch = 0;
			assign aluOp = 010;
		end
	end
	
	
	
endmodule