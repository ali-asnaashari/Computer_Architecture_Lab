`timescale 1ns / 1ps

	module MipsCache(DataLine,clockPulse,Address,Instruction,Hit);

	input [127:0] DataLine; // 128 bit Input From Instruction Memory 
	input clockPulse;
	input [31:0] Address;  // 32 bit Input Address From MipsPcRegister --> CurrentInstruction
	output reg [31:0] Instruction;  // 32 Bit Output Instruction 
	output reg Hit;  // 1 Bit That Enters the PcRegister That If the Hit = 1 will Send the next address With One Clock.

	// Cache With 8 rows & 154(2 Bit (That Always is Zero) + 128 Bit(instruction) + 2 Bit(offset) + 3 Bit(index) + 25 Bit(tag) + 1 Bit(valid) )
	reg [153:0] cache [7:0];

   //Initalize Valid Bit 0
	integer i;
	initial begin  
		for(i=0;i<8;i=i+1)
		begin
			cache[i]=0;
		end
	end

	// For 128 bit Instruction Come up Dataline
	always@(DataLine)
		begin
			if(DataLine !== 128'bx)
				begin
					cache[Address[6:4]][127:0] = DataLine; 		  // 128 Bit For 4 Instruction
					cache[Address[6:4]][152:128] = Address[31:7]; // 25 Bit For Tag
					cache[Address[6:4]][153] = 1;                // Valid Bit
				end
		end

	// Address[6:4] (3 Bit) --> index ---> what Row?

	always@(posedge clockPulse)
		begin

			if(cache[Address[6:4]][152:128] == Address[31:7] && cache[Address[6:4]][153] == 1)
				begin
					Hit = 1;
					if(Address[3:2] == 2'b00)
						Instruction = cache[Address[6:4]][31:0];
					if(Address[3:2] == 2'b01)
						Instruction = cache[Address[6:4]][63:32];
					if(Address[3:2] == 2'b10)
						Instruction = cache[Address[6:4]][95:64];
					if(Address[3:2] == 2'b11)
						Instruction = cache[Address[6:4]][127:96];
				end
			else
				begin
					Hit= 0;
					Instruction=32'bx;
				end
	end

endmodule
