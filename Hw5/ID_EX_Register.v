`timescale 1ns / 1ps

module ID_EX_Register(clockPulse,Hit,Read_Data_One,Read_Data_Two,Immediate,Reg_Destination,ALU_Source,MemToReg,RegWrite,
							 MEM_Read,MEM_Write,Branch,ALU_Operation,RT,RD,Function,Next_PC,Read_Data_One_Out,Read_Data_Two_Out,
							 Immediate_Out,Reg_Destination_Out,ALU_Source_Out,MemToReg_Out,RegWrite_Out,MEM_Read_Out,MEM_Write_Out,
							 Branch_Out,ALU_Operation_Out,RT_Out,RD_Out,Function_Out,Next_PC_Out,Hit_Out);
							 
							 
							 input clockPulse;
							 input Hit;
							 input [31:0] Read_Data_One;
							 input [31:0] Read_Data_Two;
							 input [31:0] Immediate;
							 input Reg_Destination;
							 input ALU_Source;
							 input MemToReg;
							 input RegWrite;
							 input MEM_Read;
							 input MEM_Write;
							 input Branch;
							 input [2:0]  ALU_Operation;
							 input [4:0]  RT;
							 input [4:0]  RD;
							 input [5:0]  Function;
							 input [31:0] Next_PC;
							 
							 // Output

							 output 	    Hit_Out;
							 output reg [31:0] Read_Data_One_Out;
							 output reg [31:0] Read_Data_Two_Out;
							 output reg [31:0] Immediate_Out;
							 output reg Reg_Destination_Out;
							 output reg ALU_Source_Out;
							 output reg MemToReg_Out;
							 output reg RegWrite_Out;
							 output reg MEM_Read_Out;
							 output reg MEM_Write_Out;
							 output reg Branch_Out;
							 output reg [2:0]  ALU_Operation_Out;
							 output reg [4:0]  RT_Out;
							 output reg [4:0]  RD_Out;
							 output reg [5:0]  Function_Out;
							 output reg [31:0] Next_PC_Out;
							 
									
							   assign Hit_Out = Hit;
								
								
								always @ (negedge clockPulse)
									begin
										if (Hit) 
											begin
												Read_Data_One_Out	  <= Read_Data_One;
												Read_Data_Two_Out   <= Read_Data_Two;
												Immediate_Out		  <= Immediate;
												Reg_Destination_Out <= Reg_Destination;
												ALU_Source_Out      <= ALU_Source;
												MemToReg_Out		  <= MemToReg;
												RegWrite_Out		  <= RegWrite;
												MEM_Read_Out	     <= MEM_Read;
												MEM_Write_Out		  <= MEM_Write;
												Branch_Out 			  <= Branch;
												ALU_Operation_Out   <= ALU_Operation;
												RT_Out 				  <= RT; 
												RD_Out 				  <= RD;
												Function_Out 		  <= Function;
												Next_PC_Out 		  <= Next_PC;
											end
									end
							 
	
endmodule
