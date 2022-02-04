`timescale 1ns / 1ps

module MyFast_Mips(ClockPulse);

	input ClockPulse; // 1 Bit
	

	//Fetch Module
	wire [31:0] BrachTarget_Input;
	wire [31:0] NextPc_Output;
	wire [31:0] Instruction_Output;
	wire nextPcTOIFID;
	wire PcSource_Input;
	wire Hit_Output;
	
	//IF_ID Module
	wire [31:0] InstructionIFID_Input;
	wire [31:0] InstructionIFID_Output;
	wire [31:0] NextPcIFID_Input;
	wire [31:0] NextPcIFID_Output;
	wire HitIFID_Input;
	wire HitIFID_Output;
	
	//Decode Module
	wire [31:0] InstructionDecode_Input;
	wire [5:0]  Opcode_Output;
	wire [31:0] ReadDataOne_Output;
	wire [31:0] ReadDataTwo_Output;
	wire [31:0] SignExtended_Output;
	wire [4:0] Rt;
	wire [4:0] Rd;

	//ControlUnit Module
	wire [5:0] Opcode_Input;
	wire RegDst_Output;
	wire AluSrc_Output;
	wire MemToReg_Output;
	wire RegWrite_Output;
	wire MemRead_Output;
	wire MemWrite_Output;
	wire Branch_Output;
	wire [2:0] AluOp_Output; // 3 Bit
	

	assign NextPcIFID_Input        = NextPc_Output;
	assign InstructionIFID_Input   = Instruction_Output;
	assign HitIFID_Input           = Hit_Output;
	assign InstructionDecode_Input = InstructionIFID_Output;
	assign Opcode_Input            = Opcode_Output;


	// Fetch Instance
	Mips_Fetch My_Mips_Fetch (
		 .ClockPulse(ClockPulse), 
		 .BranchTarget(BrachTarget_Input), 
		 .PcSource(PcSource_Input), 
		 .NextPc(NextPc_Output), 
		 .Instruction(Instruction_Output), 
		 .Hit(Hit_Output)
		 );

		 
	// IF_ID Instance
	Mips_IF_ID My_Mips_IF_ID (
    .ClockPulse(ClockPulse),  
    .InstructionInput(InstructionIFID_Input), 
    .HitInput(HitIFID_Input),
    .NextPcInput(NextPcIFID_Input),	 
    .NextPcOutput(NextPcIFID_Output), 
    .InstructionOutput(InstructionIFID_Output), 
    .HitOutput(HitIFID_Output)
    );
	 
	 
	 // Decode Instance
	 Mips_Decode My_Mips_Decode (
    .ClockPulse(ClockPulse), 
    .Instruction(InstructionDecode_Input), 
    .Opcode(Opcode_Output), 
    .ReadDataOne(ReadDataOne_Output), 
    .ReadDataTwo(ReadDataTwo_Output), 
    .SignExtendedImmediate(SignExtended_Output), 
    .RT(Rt), 
    .RD(Rd)
    );
	 
	 
	 // ControlUnit Instance
	 Mips_ControlUnit My_Mips_ControlUnit (
    .opCode(Opcode_Input), 
    .regDst(RegDst_Output), 
    .aluSrc(AluSrc_Output), 
    .memtoReg(MemToReg_Output), 
    .regWrite(RegWrite_Output), 
    .memRead(MemRead_Output), 
    .memWrite(MemWrite_Output), 
    .branch(Branch_Output), 
    .aluOp(AluOp_Output)
    );


endmodule
