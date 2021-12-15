`timescale 1ns / 1ps

 module Mips_PC_Register(CurrentInstructionAddress,NextInstructionAddress,ClockPulse);

	// According to the project Documentation : 
	
	input [31:0] NextInstructionAddress;
	input        ClockPulse;
	
	output reg[31:0] CurrentInstructionAddress;
	
	// Initial CurrentInstructionAddress Value For Doesn't Have "Dont care" in output
	initial begin
		CurrentInstructionAddress = 32'b0;
	end
	
	always @(posedge ClockPulse) // 0 -> 1
		  begin
				CurrentInstructionAddress = NextInstructionAddress;
		 end

endmodule
