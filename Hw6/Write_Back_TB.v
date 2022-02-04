`timescale 1ns / 1ps

module Write_Back_TB;

	// Inputs
	reg MemToReg;
	reg [31:0] readData;
	reg [31:0] ALU_Result;

	// Outputs
	wire [31:0] Write_Data;

	// Instantiate the Unit Under Test (UUT)
	Write_Back uut (
		.MemToReg(MemToReg), 
		.readData(readData), 
		.ALU_Result(ALU_Result), 
		.Write_Data(Write_Data)
	);

	initial begin

		MemToReg   = 0;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_1000; // 8
		ALU_Result = 32'b0000_0000_0000_0000_0000_0000_0000_1011; // 11

		#100;
		
		MemToReg   = 1;
		readData   = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		ALU_Result = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 10
        

	end
      
endmodule

