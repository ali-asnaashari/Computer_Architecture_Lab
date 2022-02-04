`timescale 1ns / 1ps

module MipsInstructionMemory(InstructionAddress,ClockPulse,OutputInsMemory);
	
	// According to the project Documentation : 
		
	input [31:0] InstructionAddress;
	input ClockPulse;
	
	output reg [127:0]OutputInsMemory;
	
	reg [7:0]memory[1023:0];
	
	
	reg [2:0] counter = 0;
	
	reg [31:0] index;
	
	reg [27:0] CheckAddressValue;
	
	
	/*
	   Initial Memory Value For Test
	   0 ---> 0000 0000
	   1 ---> 0000 0001
	   2 ---> 0000 0011
		.
		.
		.
		1023 ---> 
	*/
	integer i;
	initial begin	
		counter = 0;
		for (i=0 ; i<1024 ; i=i+1)
			begin
				memory[i] = i;
			end
	end
	
	// Initial OutputInsMemory Value For Doesn't Have "Dont care" in output OutputInsMemory = 128'b0;
	initial begin
		OutputInsMemory = 128'bx;
	end
	
	 always @(posedge ClockPulse) // 0 -> 1
		 begin
		 
			if(CheckAddressValue != InstructionAddress[31:4]) 
				begin
					OutputInsMemory = 128'bx;
					CheckAddressValue = InstructionAddress[31:4];
					counter = 1;
				end
				
			else if(counter == 4 )
				begin
					index = {InstructionAddress[31:4] , {4'b00}};
					// Little Endian
					OutputInsMemory = {memory[index+15],memory[index+14],memory[index+13],memory[index+12],memory[index+11],memory[index+10],memory[index+9],memory[index+8],memory[index+7],memory[index+6],memory[index+5],memory[index+4],memory[index+3],memory[index+2],memory[index+1],memory[index]} ;
					counter = 0;
				end
					
			else
				begin	
					counter = counter + 1;
				end
				
				// Put MSB bit(28bit) in CheckAddressValue for Check that Address is not Damaged in The Next Step.
				CheckAddressValue = InstructionAddress[31:4];
				
		 end

endmodule
