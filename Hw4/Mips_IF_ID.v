`timescale 1ns / 1ps

module Mips_IF_ID(ClockPulse , NextPcInput , InstructionInput , HitInput,NextPcOutput, InstructionOutput , HitOutput);


	// Acording To Project Documentation: 
		
	input 	[31:0] InstructionInput;
	input 	HitInput;
	input 	ClockPulse;
	input 	[31:0] NextPcInput;
	
	output	reg [31:0] NextPcOutput;
	output  	reg [31:0] InstructionOutput;
	output   reg HitOutput;
	
	initial
	begin
		InstructionOutput = 32'bx;
	end
	
	always @(negedge ClockPulse ) // 1 -> 0
	begin
			InstructionOutput = InstructionInput;
			NextPcOutput = NextPcInput;
			HitOutput = HitInput;	
	end


endmodule
