`timescale 1ns / 1ps

module Multiplexer_2_1(InputOne,InputTwo,SelectLine,MUX_Result);

	input [31:0] InputOne;
	input [31:0] InputTwo;
	input SelectLine;
	
	output [31:0] MUX_Result;
	
	assign MUX_Result = (SelectLine) ? InputTwo : InputOne;


endmodule
