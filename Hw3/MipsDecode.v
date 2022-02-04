`timescale 1ns / 1ps

module MipsDecode(ClockPulse,Instruction,Opcode,ReadDataOne,ReadDataTwo,SignExtendedImmediate, RT, RD);


   input ClockPulse;
	input[31:0]Instruction;
	
	output reg [5:0] Opcode;
	output reg [31:0] ReadDataOne;
	output reg [31:0] ReadDataTwo;
	output reg [31:0] SignExtendedImmediate;
	output reg[4:0] RT;
	output reg[4:0] RD;
	
	// Additional Register

	reg  [5:0]  opcode;
	reg  [4:0]  rs;
	reg  [4:0]  rt;
	reg  [4:0]  rd;
	reg  [15:0] ImmediateValue;
	wire [31:0] SignExtendValue;
	
	wire regWriteSignal;
	assign regWriteSignal = 1;
	wire [31:0] readDataOneV2;
	wire [31:0] readDataTwoV2;
	wire   writeData;
	assign writeData = 5;
	wire writeReg;
	
	always @(posedge ClockPulse)
		begin
			 opcode = Instruction[31:26];
			 rt 	  = Instruction[20:16];
			 rs 	  = Instruction[25:21];
			 rd 	  = Instruction[15:11];
			 ImmediateValue = Instruction[15:0];
			 
		end


	RegisterFile MipsRegFileInstance (
		 .ClockPulse(ClockPulse), 
		 .regWriteSignal(regWriteSignal), 
		 .readRegONE(rs), 
		 .readRegTWO(rt), 
		 .writeReg(rd), 
		 .writeData(writeData), 
		 .readDataONE(readDataOneV2), 
		 .readDataTWO(readDataTwoV2)
		 );


	MipsSignExtend MipsSignExtendInstance (
		 .value(ImmediateValue), 
		 .sign_extend_value(SignExtendValue)
		 );

	 
	always @(posedge ClockPulse) 
		begin 
			Opcode = opcode;
			SignExtendedImmediate = SignExtendValue;
			RT = rt;
			RD = rd;
			ReadDataOne = readDataOneV2;
			ReadDataTwo = readDataTwoV2;
		end


endmodule
