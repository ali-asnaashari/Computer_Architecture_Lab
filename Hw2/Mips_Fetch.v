`timescale 1ns / 1ps

	module Mips_Fetch(ClockPulse,BranchTarget,PcSource,NextPc,Instruction,Hit);

	input [31:0] BranchTarget;
	input wire ClockPulse;           // 1 Bit
	input PcSource;					  // 1 Bit
	output [31:0] NextPc;			 // 32 Bit OutPut Adder Or input Multiplexer
	output [31:0] Instruction;     // 32 Bit OutPut Cache
	output wire Hit;              // 1 Bit
	
	wire [127:0] DataLine;		  // output instructionMemory & Input Cache Or input Memory
	wire [31:0] Address;			 // 32 Bit OutPut PcRegister Or input Cache
	wire [31:0] NextAddress; 	// OutPut Multiplexer




	MipsMultiplexer MipsMultiplexerInstance (
		 .pc(NextPc), 
		 .BranchTarget(BranchTarget), 
		 .PcSource(PcSource), 
		 .Address(NextAddress)
		 );
		 
	MipsPcRegister MipsPcRegisterInstance (
		.CurrentInstructionAddress(Address), 
		.NextInstructionAddress(NextAddress), 
		.ClockPulse(ClockPulse), 
		.hit(Hit)
    );
	 
	MipsInstructionMemory MipsInstructionmemoryInstance (
		.InstructionAddress(Address), 
		.ClockPulse(ClockPulse), 
		.OutputInsMemory(DataLine)
    );

	MipsCache MipsCacheInstance (
    .DataLine(DataLine), 
    .clockPulse(ClockPulse), 
    .Address(Address), 
    .Instruction(Instruction), 
    .Hit(Hit)
    );

	 // pc = pc + 4;
	assign NextPc = Address + 4;


endmodule
