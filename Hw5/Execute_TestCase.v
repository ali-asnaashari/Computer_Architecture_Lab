`timescale 1ns / 1ps

module Execute_TestCase;

	// Inputs
	reg clockPulse;
	reg [31:0] ALU_Read_DataOne;
	reg [31:0] ALU_Read_DataTwo;
	reg [31:0] Immediate;
	reg [5:0] Function;
	reg [2:0] ALU_Operation;
	reg ALU_Source;

	// Outputs
	wire [31:0] ALU_Result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clockPulse(clockPulse), 
		.ALU_Read_DataOne(ALU_Read_DataOne), 
		.ALU_Read_DataTwo(ALU_Read_DataTwo), 
		.Immediate(Immediate), 
		.Function(Function), 
		.ALU_Operation(ALU_Operation), 
		.ALU_Source(ALU_Source), 
		.ALU_Result(ALU_Result), 
		.Zero(Zero)
	);
	
	initial 
		begin
			clockPulse = 0;
		end
	
	always # 50 clockPulse = ~clockPulse; // T=100 ns

	initial begin


		// ADD , If ALU_Source = 0 -> ALU_Read_DataTwo Choosed(5)  Output = 5 + 7  Zero = 0
		ALU_Read_DataOne = 7;
		ALU_Read_DataTwo = 5;
		Immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100; // 12;
		Function = 6'b000000;
		ALU_Operation = 3'b000;
		ALU_Source = 0;
		
		#100;
		
		
		// OR , If ALU_Source = 1 -> Immediate Choosed  Output = 6 | 12 Zero = 0
		ALU_Read_DataOne = 6;
		ALU_Read_DataTwo = 3;
		Immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1100; // 12
		Function = 6'b000011;
		ALU_Operation = 3'b000;
		ALU_Source = 1;
		
		#100;
		
		// NOT , If ALU_Source = 0 -> ALU_Read_DataTwo Choosed(6) Output = ~ALU_Read_DataOne(15) Zero = 0
		ALU_Read_DataOne = 15;
		ALU_Read_DataTwo = 6;
		Immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1101; // 13
		Function = 6'b000111;
		ALU_Operation = 3'b000;
		ALU_Source = 0;
		
		#100;
		
		// SLT , If ALU_Source = 0 -> ALU_Read_DataTwo(12)  Output = 19 < 12 ? 1 : 0  Zero = 1
		ALU_Read_DataOne = 19;
		ALU_Read_DataTwo = 12;
		Immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		Function = 6'bxxxxxx;
		ALU_Operation = 3'b010;
		ALU_Source = 0;
		
		#100;


		// LSR , If ALU_Source = 1 -> Immediate Choosed  Output = 13(1101) >> Shift_Amount(1) Zero = 0
		ALU_Read_DataOne = 13;
		ALU_Read_DataTwo = 15;
		Immediate = 32'b0000_0000_0000_0000_0000_0000_0100_0000; // Shift_Amount[10:6] = 00001
		Function = 6'b000110;
		ALU_Operation = 3'b000;
		ALU_Source = 1;
		 
		#100;

		// SUB , If ALU_Source = 1 -> Immediate Choosed  Output = 9 - 9  Zero = 1
		ALU_Read_DataOne = 9;
		ALU_Read_DataTwo = 2;
		Immediate = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		Function = 6'b000001;
		ALU_Operation = 3'b000;
		ALU_Source = 1;
		
		#100;
		


	end
      
endmodule

