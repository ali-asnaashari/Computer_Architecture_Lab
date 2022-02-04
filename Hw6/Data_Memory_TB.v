`timescale 1ns / 1ps

module Data_Memory_TB;

	// Inputs
	reg clockPulse;
	reg [31:0] address;
	reg [31:0] writeData;
	reg MemWrite;
	reg MemRead;
	
	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	Data_Memory uut (
		.clockPulse(clockPulse), 
		.address(address), 
		.writeData(writeData), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead),
		.readData(readData)
	);
	
	initial 
		begin
			clockPulse = 0;
		end
	
	always #50 clockPulse = ~clockPulse; // T=100 ns

	initial begin

		address = 32'b0000_0000_0000_0000_0000_0000_0000_1111; // 15
		writeData = 0;
		MemWrite =  0;
		MemRead =   1;

		#100;
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1000; // 8
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0100; // 4
		MemWrite  = 1;
		MemRead   = 1;
		
		#100;
		
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1000; // 8
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0101; // 5
		MemWrite  = 0;
		MemRead   = 1;
		
		#100;
				
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 10
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0101; // 5
		MemWrite  = 1;
		MemRead   = 0;
		
		#100;
				
		address   = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 10
		writeData = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		MemWrite  = 0;
		MemRead   = 1;
        

	end
      
endmodule

