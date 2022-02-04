`timescale 1ns / 1ps

module MipsSignExtendTest;

	// Inputs
	reg [15:0] value;

	// Outputs
	wire [31:0] sign_extend_value;

	// Instantiate the Unit Under Test (UUT)
	MipsSignExtend uut (
		.value(value), 
		.sign_extend_value(sign_extend_value)
	);

	initial begin
		value = 16'b1111111111111111;
		#100;
		value = 16'b100;

	end
      
endmodule

