`timescale 1ns / 1ps

module MipsPcRegister(CurrentInstructionAddress,NextInstructionAddress,ClockPulse,hit);

	// According to the project Documentation : 
	
	input [31:0] NextInstructionAddress;
	input        ClockPulse;
	input        hit;
	
	output reg[31:0] CurrentInstructionAddress;
	
	// Initial CurrentInstructionAddress Value For Doesn't Have "Dont care" in output
	initial begin
		CurrentInstructionAddress = 32'b0;
	end
	
	always @(negedge ClockPulse) // 1 -> 0
		  begin
				if(hit == 1)
					CurrentInstructionAddress = NextInstructionAddress;
		 end

endmodule
