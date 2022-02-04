`timescale 1ns / 1ps


module ID_EX_Register_TestCase;

	// Inputs
	reg clockPulse;
	reg Hit;
	reg [31:0] Read_Data_One;
	reg [31:0] Read_Data_Two;
	reg [31:0] Immediate;
	reg Reg_Destination;
	reg ALU_Source;
	reg MemToReg;
	reg RegWrite;
	reg MEM_Read;
	reg MEM_Write;
	reg Branch;
	reg [2:0] ALU_Operation;
	reg [4:0] RT;
	reg [4:0] RD;
	reg [5:0] Function;
	reg [31:0] Next_PC;

	// Outputs
	wire [31:0] Read_Data_One_Out;
	wire [31:0] Read_Data_Two_Out;
	wire [31:0] Immediate_Out;
	wire Reg_Destination_Out;
	wire ALU_Source_Out;
	wire MemToReg_Out;
	wire RegWrite_Out;
	wire MEM_Read_Out;
	wire MEM_Write_Out;
	wire Branch_Out;
	wire [2:0] ALU_Operation_Out;
	wire [4:0] RT_Out;
	wire [4:0] RD_Out;
	wire [5:0] Function_Out;
	wire [31:0] Next_PC_Out;
	wire Hit_Out;

	// Instantiate the Unit Under Test (UUT)
	ID_EX_Register uut (
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
	
	initial 
		begin
			clockPulse = 0;
		end
	
	always # 250 clockPulse = ~clockPulse; // T=100 ns

	initial begin

		Hit = 0;
		Read_Data_One = 32'b0000_0000_0000_0000_0000_0000_0000_1101;   // 13
		Read_Data_Two = 32'b0000_0000_0000_0000_0000_0000_0000_1001;  //  9
		Immediate =     32'b0000_0000_0000_0000_0000_0000_0000_1111; //   15
		Reg_Destination = 1;
		ALU_Source = 0;
		MemToReg = 1;
		RegWrite = 1;
		MEM_Read = 0;
		MEM_Write = 0;
		Branch = 1;
		ALU_Operation = 3'b100;
		RT = 5'b01100;
		RD = 5'b01010;
		Function = 6'b01101;
		Next_PC = 32'b0000_0000_0000_0000_0000_0000_0000_0011;  // 3

		#500;
		
		Hit = 1;
		Read_Data_One = 32'b0000_0000_0000_0000_0000_0000_0000_0111;   // 7
		Read_Data_Two = 32'b0000_0000_0000_0000_0000_0000_0000_1010;  //  10
		Immediate =     32'b0000_0000_0000_0000_0000_0000_0000_1100; //   12
		Reg_Destination = 1;
		ALU_Source = 0;
		MemToReg = 0;
		RegWrite = 1;
		MEM_Read = 1;
		MEM_Write = 0;
		Branch = 1;
		ALU_Operation = 3'b110;
		RT = 5'b01110;
		RD = 5'b01100;
		Function = 6'b11101;
		Next_PC = 32'b0000_0000_0000_0000_0000_0000_0000_1111;  // 15
		
		#500;
        

	end
      
endmodule

