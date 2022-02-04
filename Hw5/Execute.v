`timescale 1ns / 1ps

module Execute(clockPulse,ALU_Read_DataOne,ALU_Read_DataTwo,Immediate,Function,ALU_Operation,ALU_Source,ALU_Result,Zero);

	input clockPulse;
	input [31:0] ALU_Read_DataOne;
	input [31:0] ALU_Read_DataTwo;
	input [31:0] Immediate;
	input [5:0]  Function;
	input [2:0]  ALU_Operation;
	input ALU_Source;
	
	output [31:0] ALU_Result;
	output Zero;
	
	
	wire [31:0] ALU_Input_DataTwo;
	wire [3:0] AlU_Control;
	wire  [4:0] Shift_Amount;
	assign Shift_Amount = Immediate[10:6];
	
	
	// Multiplexer_2_1 Instance
	Multiplexer_2_1 MUX (
		 .InputOne(ALU_Read_DataTwo), 
		 .InputTwo(Immediate), 
		 .SelectLine(ALU_Source), 
		 .MUX_Result(ALU_Input_DataTwo)
		 );
	
	// ALU_Control_Unit Instance
	ALU_Control_Unit ALU_CU (
		 .ALU_Operation(ALU_Operation), 
		 .Function(Function), 
		 .AlU_Control(AlU_Control)
		 );
		 
		 
	// ALU Instance
	ALU ALU_Instance (
		 .InputOne(ALU_Read_DataOne), 
		 .InputTwo(ALU_Input_DataTwo), 
		 .ALU_Control(AlU_Control), 
		 .Shift_Amount(Shift_Amount), 
		 .Result(ALU_Result), 
		 .Zero(Zero)
		 );


endmodule
