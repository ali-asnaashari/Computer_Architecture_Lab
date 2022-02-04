`timescale 1ns / 1ps


module ALU_TestCase;

	// Inputs
	reg [31:0] InputOne;
	reg [31:0] InputTwo;
	reg [3:0] ALU_Control;
	reg [4:0] Shift_Amount;

	// Outputs
	wire [31:0] Result;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.InputOne(InputOne), 
		.InputTwo(InputTwo), 
		.ALU_Control(ALU_Control), 
		.Shift_Amount(Shift_Amount), 
		.Result(Result), 
		.Zero(Zero)
	);

	initial begin
	
		// ADD output -> Result = 0000_0000_0000_0000_0000_0000_0000_1100  Zero = 0
		InputOne = 5;
		InputTwo = 7;
		ALU_Control = 4'b0000;
		Shift_Amount = 5'b0110;   		   // Dont Care
		
		#250;

		// NOT output -> Result = 1111_1111_1111_1111_1111_1111_1111_1011  Zero = 0
		InputOne = 4; 
		InputTwo = 9;						  // Dont Care
		ALU_Control = 4'b0010;
		Shift_Amount = 5'b0100;  		 // Dont Care
		
		#250;
		
		// LSR output -> Result = 0000_0000_0000_0000_0000_0000_0000_0001  Zero = 0
		InputOne = 6; 
		InputTwo = 8;             	   // Dont Care
		ALU_Control = 4'b0100;
		Shift_Amount = 5'b00010;
		
		#250;
		
		// SLT output -> Result = 0000_0000_0000_0000_0000_0000_0000_0000  Zero = 1
		InputOne = 14;
		InputTwo = 4;
		ALU_Control = 4'b0111;
		Shift_Amount = 5'b0110;      // Dont Care

	end
      
endmodule

