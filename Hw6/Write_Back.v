`timescale 1ns / 1ps

module Write_Back(MemToReg,readData,ALU_Result,Write_Data);

	input MemToReg;
	input [31:0] readData;
	input [31:0] ALU_Result;

	output reg [31:0] Write_Data;
	
	always @(*)
		begin 
			if (MemToReg == 1)
				Write_Data = readData;
			else
				Write_Data = ALU_Result;
		end
	

endmodule
