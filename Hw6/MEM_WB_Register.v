`timescale 1ns / 1ps

module MEM_WB_Register(clockPulse, hit, readData, ALUResult, writeReg, RegWrite, MemtoReg,hitOut, readDataOut,
							  ALUResultOut, writeRegOut, RegWriteOut,MemtoRegOut);


	input clockPulse;
	input hit;
	input RegWrite;
	input MemtoReg;
	input [4:0] writeReg;
	input [31:0]readData;
	input [31:0]ALUResult;
	
	output     hitOut ;
	output reg RegWriteOut;
	output reg MemtoRegOut;
	output reg [4:0]  writeRegOut;
	output reg [31:0] readDataOut;
	output reg [31:0] ALUResultOut;
	
	assign hitOut = hit;
	
	always @(negedge clockPulse)
		begin
			if(hit) 
				begin 
					MemtoRegOut  <= MemtoReg;
					RegWriteOut  <= RegWrite;
					writeRegOut  <= writeReg;
					readDataOut  <= readData;
					ALUResultOut <= ALUResult;		
				end
		end

endmodule
