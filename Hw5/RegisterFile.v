`timescale 1ns / 1ps

module RegisterFile(ClockPulse,regWriteSignal,readRegONE,readRegTWO,writeReg,writeData,readDataONE,readDataTWO);

	// According To The Documentation:
	input ClockPulse;
	input regWriteSignal;
	input [4:0] readRegONE;
	input [4:0] readRegTWO;
	input [4:0] writeReg;
	input [31:0] writeData;
	
	
	output [31:0] readDataONE;
	output [31:0] readDataTWO;
	
	
	reg [31:0] regFile [31:0];

	
	assign readDataONE = regFile[readRegONE];
	assign readDataTWO = regFile[readRegTWO];
	
	// regZero = 0
	initial regFile[0] = 0; 
	
	integer i;
	initial  
		begin 
			for(i=1 ; i<32 ; i=i+1)
				regFile[i] = i;
		end
		
		
	always @(posedge ClockPulse) // 0 -> 1
		begin
			if (regWriteSignal == 1)
				begin
				if (writeReg == 0) // ZeroReg Cant Assign Value
					begin
						$display("%h", regFile[writeReg]);
						$display("OOps:( You cant able to change zeroRegister Value");
						$display("%h", regFile[writeReg]);
					end
				else 	
					begin
						$display("%h", regFile[writeReg]);
						regFile[writeReg] = writeData;
						$display("%h", regFile[writeReg]);
						$display("Good Job");
					end
			end
			else
				begin
					$display("%h", regFile[writeReg]);
					$display("Permittion Denied");
					$display("%h", regFile[writeReg]);
				end
		end

endmodule
