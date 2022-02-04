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
	
	// Execute
	wire [31:0] ID_EX_Read_Data_One;
	wire [31:0] ID_EX_Read_Data_Two;
	wire [31:0] ID_EX_Immediate;
	wire [2:0]  ID_EX_ALU_Operation;
	wire ID_EX_ALU_Source;
	wire [31:0] Execute_ALU_Result;
	wire Execute_Zero;


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
	 
	 
	 // Execute Instance
	Execute My_Mips_Execute (
		 .clockPulse(clockPulse), 
		 .ALU_Read_DataOne(ID_EX_Read_Data_One), 
		 .ALU_Read_DataTwo(ID_EX_Read_Data_Two), 
		 .Immediate(ID_EX_Immediate), 
		 .Function(Function), 
		 .ALU_Operation(ID_EX_ALU_Operation), 
		 .ALU_Source(ID_EX_ALU_Source), 
		 .ALU_Result(Execute_ALU_Result), 
		 .Zero(Execute_Zero)
		 );
	 
	 
	// ID_EX_Register Instance
	ID_EX_Register My_Mips_ID_EX (
		 .clockPulse(clockPulse), 
		 .Hit(Hit), 
		 .Read_Data_One(Read_Data_One), 
		 .Read_Data_Two(Read_Data_Two), 
		 .Immediate(Immediate), 
		 .Reg_Destination(Reg_Destination), 
		 .ALU_Source(ALU_Source), 
		 .MemToReg(MemToReg), 
		 .RegWrite(RegWrite), 
		 .MEM_Read(MEM_Read), 
		 .MEM_Write(MEM_Write), 
		 .Branch(Branch), 
		 .ALU_Operation(ALU_Operation), 
		 .RT(RT), 
		 .RD(RD), 
		 .Function(Function), 
		 .Next_PC(Next_PC), 
		 .Read_Data_One_Out(Read_Data_One_Out), 
		 .Read_Data_Two_Out(Read_Data_Two_Out), 
		 .Immediate_Out(Immediate_Out), 
		 .Reg_Destination_Out(Reg_Destination_Out), 
		 .ALU_Source_Out(ALU_Source_Out), 
		 .MemToReg_Out(MemToReg_Out), 
		 .RegWrite_Out(RegWrite_Out), 
		 .MEM_Read_Out(MEM_Read_Out), 
		 .MEM_Write_Out(MEM_Write_Out), 
		 .Branch_Out(Branch_Out), 
		 .ALU_Operation_Out(ALU_Operation_Out), 
		 .RT_Out(RT_Out), 
		 .RD_Out(RD_Out), 
		 .Function_Out(Function_Out), 
		 .Next_PC_Out(Next_PC_Out), 
		 .Hit_Out(Hit_Out)
		 );
	 
	

endmodule
