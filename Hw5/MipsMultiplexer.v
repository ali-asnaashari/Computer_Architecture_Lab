`timescale 1ns / 1ps

module MipsMultiplexer(pc,BranchTarget,PcSource,Address);

	input [31:0]pc; 				  // 32 Bit
	input [31:0] BranchTarget;  // 32 Bit
	input PcSource;  				// 1 Bit
	output reg[31:0] Address;

	always @(PcSource or pc or BranchTarget)
		begin 
			if (PcSource == 1)
				Address = BranchTarget;
			if (PcSource == 0)
				Address = pc;
		end

endmodule
