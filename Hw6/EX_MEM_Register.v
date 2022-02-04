`timescale 1ns / 1ps

module EX_MEM_Register(clockPulse, hit, branchTarget, zeroFlag, ALUResult, readDataTwo,writeReg, MemRead,
							  MemWrite, Branch, RegWrite, MemToReg ,branchTargetOut, zeroFlagOut, ALUResultOut, 
							  readDataTwoOut,writeRegOut, MemReadOut, MemWriteOut, BranchOut, RegWriteOut,
							  MemToRegOut, hitOut);

	input clockPulse;
	input hit;
	input zeroFlag;
	input MemRead;
	input MemWrite;
	input Branch;
	input RegWrite;
	input MemToReg;
	input [31:0] branchTarget;
	input [31:0] ALUResult;
	input [31:0] readDataTwo;
	input [4:0]  writeReg;
	

	output reg zeroFlagOut;
	output reg MemReadOut;
	output reg MemWriteOut;
	output reg BranchOut;
	output reg RegWriteOut;
	output reg MemToRegOut;
	output reg [31:0] branchTargetOut;
	output reg [31:0] ALUResultOut;
	output reg [31:0] readDataTwoOut;
	output reg [4:0] writeRegOut;
	output hitOut;
	
	assign hitOut = hit;

	always @(negedge clockPulse) 
		begin
		  if(hit) 
				begin 
				  writeRegOut    <= writeReg;
				  branchTargetOut<= branchTarget;
				  ALUResultOut   <= ALUResult;
				  readDataTwoOut <= readDataTwo;
				  zeroFlagOut    <= zeroFlag;
				  MemReadOut     <= MemRead;
				  MemWriteOut    <= MemWrite;
				  BranchOut      <= Branch;
				  RegWriteOut    <= RegWrite;
				  MemToRegOut    <= MemToReg;
				end
		end

endmodule
