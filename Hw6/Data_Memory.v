`timescale 1ns / 1ps

module Data_Memory(clockPulse,address,writeData,MemWrite,MemRead,readData);

	input clockPulse;
	input [31:0] address;
	input [31:0] writeData;
	input MemWrite;
	input MemRead;
	
	output reg [31:0] readData;

	// 1024 Row & 8 column
	reg [7:0] RAM [1023:0];
	
	integer i;
	initial
		begin
			for(i = 0;i<=1023;i = i+1)
				RAM[i] = i;
		end
	
	always @ (posedge clockPulse)
		begin
			if (MemRead)
				begin

					// readData = {RAM[address+3], RAM[address+2], RAM[address+1], RAM[address]};
					// OR
					readData [7:0]   = RAM[address];
					readData [15:8]  = RAM[address+1];
					readData [23:16] = RAM[address+2];
					readData [31:24] = RAM[address+3];
				end
			
			if (MemWrite) 
				begin
					RAM[address]   = writeData[7:0];
					RAM[address+1] = writeData[15:8];
					RAM[address+2] = writeData[23:16];
					RAM[address+3] = writeData[31:24];
					$display("After Write RAM[address] is = %b",RAM[address]);
				end	
		end


endmodule
