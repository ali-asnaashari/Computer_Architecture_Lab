`timescale 1ns / 1ps


module Mips_PC_Register_TB;

	// Inputs
	reg [31:0] NextInstructionAddress;
	reg ClockPulse;
	reg hit;

	// Outputs
	wire [31:0] CurrentInstructionAddress;

	// Instantiate the Unit Under Test (UUT)
	Mips_PC_Register uut (
		.CurrentInstructionAddress(CurrentInstructionAddress), 
		.NextInstructionAddress(NextInstructionAddress), 
		.ClockPulse(ClockPulse), 
		.hit(hit)
	);

	initial begin
		// Initialize Inputs
		NextInstructionAddress = 0;      // 0000 0000 0000 0000 0000 0000 0000 0000
		ClockPulse = 1;
		hit = 0;

		#100;
		NextInstructionAddress = 32'b1; // 0000 0000 0000 0000 0000 0000 0000 0001
		ClockPulse = 1;
		hit = 0;
		
		#100;
		NextInstructionAddress = 32'b10; // 0000 0000 0000 0000 0000 0000 0000 0010
		ClockPulse = 0;
		hit = 0;
		
		#100;
		NextInstructionAddress = 32'b11; // 0000 0000 0000 0000 0000 0000 0000 0011
		ClockPulse = 1;
		hit = 1;
		
		#100;
		NextInstructionAddress = 32'b100; // 0000 0000 0000 0000 0000 0000 0000 0100  output --> BC ClockPulse 1->0 & Hit = 1;
		ClockPulse = 0;
		hit = 1;
      
		// Add stimulus here

	end
      
endmodule

