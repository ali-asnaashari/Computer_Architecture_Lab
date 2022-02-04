`timescale 1ns / 1ps

module Mips_IF_ID_TestCase;

	// Inputs
	reg ClockPulse;
	reg [31:0] NextPcInput;
	reg [31:0] InstructionInput;
	reg HitInput;

	// Outputs
	wire [31:0] NextPcOutput;
	wire [31:0] InstructionOutput;
	wire HitOutput;

	// Instantiate the Unit Under Test (UUT)
	Mips_IF_ID uut (
		.ClockPulse(ClockPulse), 
		.NextPcInput(NextPcInput), 
		.InstructionInput(InstructionInput), 
		.HitInput(HitInput), 
		.NextPcOutput(NextPcOutput), 
		.InstructionOutput(InstructionOutput), 
		.HitOutput(HitOutput)
	);
	

	always
	begin
		#50; ClockPulse = ~ClockPulse; // T = 100 ns
	end


	initial begin

		ClockPulse = 0;
		
		NextPcInput = 0;
		InstructionInput = 32'b1;
		HitInput = 0;
		
		#100;
		
		NextPcInput = 4;
		InstructionInput = 32'b10;
		HitInput = 1;
		
		#100;

		NextPcInput = 8;
		InstructionInput = 32'b11;
		HitInput = 0;
		
		#100;

		NextPcInput = 12;
		InstructionInput = 32'b100;
		HitInput = 0;
		
		#100;
		
		NextPcInput = 16;
		InstructionInput = 32'b101;
		HitInput = 1;


	end
      
endmodule

