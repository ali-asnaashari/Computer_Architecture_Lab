`timescale 1ns / 1ps

module ControlUnit_TestCase;

	// Inputs
	reg [5:0] opCode;

	// Outputs
	wire regDst;
	wire aluSrc;
	wire memtoReg;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire branch;
	wire [2:0] aluOp;

	// Instantiate the Unit Under Test (UUT)
	Mips_ControlUnit uut (
		.opCode(opCode), 
		.regDst(regDst), 
		.aluSrc(aluSrc), 
		.memtoReg(memtoReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.branch(branch), 
		.aluOp(aluOp)
	);

	initial begin
	
		opCode = 6'b000000;
		
		#100;
		
		opCode = 6'b000100;
		
		#100;
		
		opCode = 6'b000101;
		
		
		#100;
		
		opCode = 6'b000111;
		
		#100;
		
		opCode = 6'b000110;
		
		#100;
		
		opCode = 6'b111111;
		
		#100;
		
		opCode = 6'b000010;
		
	end
      
endmodule

