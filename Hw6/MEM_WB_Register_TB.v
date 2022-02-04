`timescale 1ns / 1ps


module MEM_WB_Register_TB;

	// Inputs
	reg clockPulse;
	reg hit;
	reg [31:0] readData;
	reg [31:0] ALUResult;
	reg [4:0] writeReg;
	reg RegWrite;
	reg MemtoReg;

	// Outputs
	wire hitOut;
	wire [31:0] readDataOut;
	wire [31:0] ALUResultOut;
	wire [4:0] writeRegOut;
	wire RegWriteOut;
	wire MemtoRegOut;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB_Register uut (
		.clockPulse(clockPulse), 
		.hit(hit), 
		.readData(readData), 
		.ALUResult(ALUResult), 
		.writeReg(writeReg), 
		.RegWrite(RegWrite), 
		.MemtoReg(MemtoReg), 
		.hitOut(hitOut), 
		.readDataOut(readDataOut), 
		.ALUResultOut(ALUResultOut), 
		.writeRegOut(writeRegOut), 
		.RegWriteOut(RegWriteOut), 
		.MemtoRegOut(MemtoRegOut)
	);
	
	initial 
		begin
			clockPulse = 0;
		end
	
	always # 250 clockPulse = ~clockPulse; // T=500 ns


	initial begin

		hit       = 0;
		readData  = 5'b01110;
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0000_0110; // 6
		writeReg  = 0;
		RegWrite  = 0;
		MemtoReg  = 1;

		#500;
		
		hit       = 1;
		readData  = 5'b10100;
		ALUResult = 32'b0000_0000_0000_0000_0000_0000_0001_0000; // 16
		writeReg  = 0;
		RegWrite  = 1;
		MemtoReg  = 0;
        


	end
      
endmodule

