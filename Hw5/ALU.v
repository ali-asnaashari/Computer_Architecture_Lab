`timescale 1ns / 1ps

module ALU(InputOne,InputTwo,ALU_Control,Shift_Amount,Result,Zero);

	input [31:0] InputOne;
	input [31:0] InputTwo;
	input [3:0]  ALU_Control;
	input [4:0]  Shift_Amount;
	
	output reg [31:0] Result;
	output reg Zero;
	
	always @(ALU_Control)
		begin
			if(ALU_Control == 4'b0000)
			
				begin
					assign Result = InputOne + InputTwo;
				end
				
			else if(ALU_Control == 4'b0001)
				begin
					assign Result = InputOne - InputTwo;
				end

			else if(ALU_Control == 4'b0010)
				begin
					assign Result = ~InputOne;
				end

			else if(ALU_Control == 4'b0011)
				begin
					assign Result = InputOne << Shift_Amount;
				end
				
			else if(ALU_Control == 4'b0100)
				begin
					assign Result = InputOne >> Shift_Amount;
				end
				
			else if(ALU_Control == 4'b0101)
				begin
					assign Result = InputOne & InputTwo;
				end
				
			else if(ALU_Control == 4'b0110)
				begin
					assign Result = InputOne | InputTwo;
				end
				
			else if(ALU_Control == 4'b0111)
				begin
					assign Result = (InputOne < InputTwo)? 32'b1 : 32'b0;
				end
			
			else
				begin
					assign Result = 32'bx;
				end
		
			assign Zero = (Result == 32'b0)? 1 : 0;
		end
	


endmodule
