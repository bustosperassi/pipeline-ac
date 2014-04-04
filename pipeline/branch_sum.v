`timescale 1ns / 1ps

module branch_sum  #(parameter PC_WIDE = 7)(
    input rst,
	 input [5:0]opcode,
	 input [31:0] d1,
	 input [31:0] d2,
	 input [PC_WIDE - 1:0] pc_next,
    input [6:0] pc_branch,
	 output reg taken,
    output reg [PC_WIDE - 1:0] branch_pc
    );
	 
	parameter BEQ = 6'b000100;
	parameter BNE = 6'b000101;
	parameter JUMP = 6'b000010;
	
	always @(*) begin
		if (rst == 1) begin
			branch_pc <= 0;
			taken <= 0;
		end
		else begin
			case(opcode)
				BEQ: begin
							if(d1 == d2) begin
								branch_pc <= pc_next + pc_branch[PC_WIDE - 1:0];
								taken <= 1;
							end
							else begin
								taken <= 0;
								branch_pc <= 0;
							end
						end
				BNE: begin
							if(d1 != d2) begin
								branch_pc <= pc_next + pc_branch[PC_WIDE - 1:0];
								taken <= 1;
							end
							else begin
								taken <= 0;
								branch_pc <= 0;
							end
						end
				JUMP: begin
							branch_pc <= pc_branch;
							taken <= 1;
						end
				default: begin
								branch_pc <= 0;
								taken <= 0;
						end
			endcase
		end
	end
	
endmodule
