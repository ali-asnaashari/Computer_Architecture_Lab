`timescale 1ns / 1ps

module MipsRegisterFileTest;

	// Inputs
	reg ClockPulse;
	reg regWriteSignal;
	reg [4:0] readRegONE;
	reg [4:0] readRegTWO;
	reg [4:0] writeReg;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] readDataONE;
	wire [31:0] readDataTWO;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.ClockPulse(ClockPulse), 
		.regWriteSignal(regWriteSignal), 
		.readRegONE(readRegONE), 
		.readRegTWO(readRegTWO), 
		.writeReg(writeReg), 
		.writeData(writeData), 
		.readDataONE(readDataONE), 
		.readDataTWO(readDataTWO)
	);
	always 
		begin
			#50	ClockPulse = ~ClockPulse;    // T = 100ns
		end 

	initial begin
		// Initialize Inputs
		ClockPulse = 0;
		

	   readRegONE = 15;
		readRegTWO = 10;
		writeReg =   5;
		regWriteSignal = 1;
		writeData = 3;
		
		
		#100;

		readRegONE = 12;
		readRegTWO = 8;
		writeReg =   0;
		regWriteSignal = 1;
		writeData = 5;
		
		#100;

		readRegONE = 20;
		readRegTWO = 16;
		writeReg =   1;
		regWriteSignal = 0;
		writeData = 9;

	end
      
endmodule

