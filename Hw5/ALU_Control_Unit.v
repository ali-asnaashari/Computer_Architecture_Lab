`timescale 1ns / 1ps

module ALU_Control_Unit(ALU_Operation,Function,AlU_Control);

	input [2:0]  ALU_Operation;
	input [5:0]  Function;
	
	output reg [3:0] AlU_Control;
	
	
	always @(ALU_Operation or Function)
		begin
			if(ALU_Operation == 3'b000)
			
				begin
				
					if(Function == 6'b000000)
						begin
							assign AlU_Control = 4'b0000;  // ADD
						end
					else if(Function == 6'b000001)
						begin
							assign AlU_Control = 4'b0001;  // SUB
						end
					else if(Function == 6'b000010)
						begin
							assign AlU_Control = 4'b0101;  // AND
						end
					else if(Function == 6'b000011)
						begin
							assign AlU_Control = 4'b0110;  // OR
						end
					else if(Function == 6'b000100)
						begin
							assign AlU_Control = 4'b0111;  // SLT
						end
					else if(Function == 6'b000101)
						begin
							assign AlU_Control = 4'b0011;  // LSL
						end
					else if(Function == 6'b000110)
						begin
							assign AlU_Control = 4'b0100;  // LSR
						end
					else if(Function == 6'b000111)
						begin
							assign AlU_Control = 4'b0010;  // NOT
						end
				end
				
			else if(ALU_Operation == 3'b001)
				begin
					assign AlU_Control = 4'b0001;  // BEQ -> SUB
				end
			
			else if(ALU_Operation == 3'b010)
				begin
					assign AlU_Control = 4'b0111;  // SLTI -> SLT
				end
			
			else if(ALU_Operation == 3'b011)
				begin
					assign AlU_Control = 4'b0000;  // ADDI-LW-SW -> ADD
				end
		end

endmodule
