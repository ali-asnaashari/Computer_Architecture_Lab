`timescale 1ns / 1ps


module Mips_Instruction_Memory_TB;

	// Inputs
	reg [31:0] InstructionAddress;
	reg ClockPulse = 0;

	// Outputs
	wire [127:0] OutputInsMemory;

	// Instantiate the Unit Under Test (UUT)
	Mips_Instruction_Memory uut (
		.InstructionAddress(InstructionAddress), 
		.ClockPulse(ClockPulse), 
		.OutputInsMemory(OutputInsMemory)
	);
	
	
	initial forever #50 ClockPulse = ~ClockPulse;   // T = 100ns
	
	initial begin
	
	// TestCaseOne
	/*
	InstructionAddress = 0;
	#500;
	InstructionAddress = 8;
	#500;
	*/


	
	// TestCaseTwo
	/*
	InstructionAddress = 0;
	#500;
	InstructionAddress = 10;
	#500;
	*/
	
	// TestCaseThree

	InstructionAddress = 8;    // 0-15   output --> 0-15   --> 4 instruction
	#500;
	InstructionAddress = 17;   //  16-31 output --> 16-31  --> 4 instruction
	#500;
	InstructionAddress = 33;   // 32-47  output --> 32-47  --> 4 instruction
	#500;
	InstructionAddress = 50;   // 48-63  output --> 48-63  --> 4 instruction
	#500;

		

	end


endmodule

