`timescale 1ns / 1ps

module Mips_Multiplexer_TB;

	// Inputs
	reg [31:0] FirstInput;
	reg [31:0] SecondInput;
	reg SelectionLine;

	// Outputs
	wire [31:0] MulOutput;

	// Instantiate the Unit Under Test (UUT)
	Mips_Multiplexer uut (
		.FirstInput(FirstInput), 
		.SecondInput(SecondInput), 
		.SelectionLine(SelectionLine), 
		.MulOutput(MulOutput)
	);

	initial begin
		// Initialize Inputs
		SelectionLine = 0;
		FirstInput = 32'b0;       // 0000 0000 0000 0000 0000 0000 0000 0000   output
		SecondInput = 32'b1;     // 0000 0000 0000 0000 0000 0000 0000  0001


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		SelectionLine = 1;
		FirstInput = 32'b101;     // 0000 0000 0000 0000 0000 0000 0000 0101
		SecondInput = 32'b1001;   // 0000 0000 0000 0000 0000 0000 0000 1001   output
		
		#100;
	
		SelectionLine = 0;
		FirstInput = 32'b100;     // 0000 0000 0000 0000 0000 0000 0000  0100  output
		SecondInput = 32'b1101;   // 0000 0000 0000 0000 0000 0000 0000  1101

	end
      
endmodule

