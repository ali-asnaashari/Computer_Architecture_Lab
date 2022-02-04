`timescale 1ns / 1ps


module EX_MEM_Register_TB;

	// Inputs
	reg clockPulse;
	reg hit;
	reg [31:0] branchTarget;
	reg zeroFlag;
	reg [31:0] ALUResult;
	reg [31:0] readDataTwo;
	reg [4:0] writeReg;
	reg MemRead;
	reg MemWrite;
	reg Branch;
	reg RegWrite;
	reg MemToReg;

	// Outputs
	wire [31:0] branchTargetOut;
	wire zeroFlagOut;
	wire [31:0] ALUResultOut;
	wire [31:0] readDataTwoOut;
	wire [4:0] writeRegOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire BranchOut;
	wire RegWriteOut;
	wire MemToRegOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	EX_MEM_Register uut (
		.clockPulse(clockPulse), 
		.hit(hit), 
		.branchTarget(branchTarget), 
		.zeroFlag(zeroFlag), 
		.ALUResult(ALUResult), 
		.readDataTwo(readDataTwo), 
		.writeReg(writeReg), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.branchTargetOut(branchTargetOut), 
		.zeroFlagOut(zeroFlagOut), 
		.ALUResultOut(ALUResultOut), 
		.readDataTwoOut(readDataTwoOut), 
		.writeRegOut(writeRegOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.BranchOut(BranchOut), 
		.RegWriteOut(RegWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.hitOut(hitOut)
	);
	
	initial 
		begin
			clockPulse = 0;
		end
	
	always # 250 clockPulse = ~clockPulse; // T=500 ns

	initial begin


		hit          = 0;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_0000_0111; // 7
		zeroFlag     = 0;
		ALUResult    = 32'b0000_0000_0000_0000_0000_0000_0000_0101; // 5
		readDataTwo  = 32'b0000_0000_0000_0000_0000_0000_0000_1001; // 9
		writeReg 	 = 5'b10010;
		MemRead      = 0;
		MemWrite     = 1;
		Branch       = 1;
		RegWrite     = 0;
		MemToReg     = 1;

		#500;
		
		hit = 1;
		branchTarget = 32'b0000_0000_0000_0000_0000_0000_0000_1111; // 15
		zeroFlag     = 0;
		ALUResult    = 32'b0000_0000_0000_0000_0000_0000_0000_1010; // 10
		readDataTwo  = 32'b0000_0000_0000_0000_0000_0000_0000_1101; // 13
		writeReg     = 5'b10101;
		MemRead      = 1;
		MemWrite     = 1;
		Branch       = 0;
		RegWrite     = 1;
		MemToReg     = 0;
        

	end
      
endmodule

