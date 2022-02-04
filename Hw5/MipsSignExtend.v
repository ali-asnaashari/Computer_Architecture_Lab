`timescale 1ns / 1ps

module MipsSignExtend(value,sign_extend_value);

	input  [15:0]  value;
	output [31:0]  sign_extend_value;
	
	
	assign sign_extend_value [15:0] = value;
	assign sign_extend_value [31:16] = {16{value[15]}};


endmodule
