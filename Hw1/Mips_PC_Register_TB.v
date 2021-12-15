`timescale 1ns / 1ps

module Mips_PC_Register_TB;

	// Inputs
	reg [31:0] NextInstructionAddress;
	reg ClockPulse;

	// Outputs
	wire [31:0] CurrentInstructionAddress;

	// Instantiate the Unit Under Test (UUT)
	Mips_PC_Register_TB uut (
		.CurrentInstructionAddress(CurrentInstructionAddress), 
		.NextInstructionAddress(NextInstructionAddress), 
		.ClockPulse(ClockPulse)
	);

	initial begin
		// Initialize Inputs
		ClockPulse = 0;
		NextInstructionAddress = 32'b011;     // 0000 0000 0000 0000 0000 0000 0000  0011  


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ClockPulse = 1;
		NextInstructionAddress = 32'b100;   // 0000 0000 0000 0000 0000 0000 0000  0100  output
		
		#100;
		ClockPulse = 0;
		NextInstructionAddress = 32'b110;   // 0000 0000 0000 0000 0000 0000 0000  0110  
		
		#100;
		ClockPulse = 1;
		NextInstructionAddress = 32'b101;	// 0000 0000 0000 0000 0000 0000 0000  0101  output	

	end
      
endmodule

