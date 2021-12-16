`timescale 1ns / 1ps


module Mips_Fetch_TB;

	// Inputs
	reg ClockPulse;
	reg [31:0] BranchTarget;
	reg PcSource;

	// Outputs
	wire [31:0] NextPc;
	wire [31:0] Instruction;
	wire Hit;
	
	// Instantiate the Unit Under Test (UUT)
	Mips_Fetch uut (
		.ClockPulse(ClockPulse), 
		.BranchTarget(BranchTarget), 
		.PcSource(PcSource), 
		.NextPc(NextPc), 
		.Instruction(Instruction), 
		.Hit(Hit)
	);
	initial begin
		ClockPulse = 0;
	end
	always # 50 ClockPulse =~ClockPulse;  //T = 100 ns

	
	initial begin
		BranchTarget = 0;
		PcSource = 0;
	end

 
endmodule

