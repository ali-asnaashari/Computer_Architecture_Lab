`timescale 1ns / 1ps

module MipsMultiplexer(FirstInput,SecondInput,SelectionLine,MulOutput);

	// According to the project Documentation : 
	
	input [31:0] FirstInput;
	input [31:0] SecondInput;
	input SelectionLine;
	
	output reg[31:0] MulOutput;
	
	// Sensitive To All input and selectionLine
	always @(FirstInput or SecondInput or SelectionLine)
	      begin
				  if (SelectionLine == 0)
				      MulOutput = FirstInput;
						
				  if (SelectionLine == 1)
						MulOutput = SecondInput;
			end

endmodule
