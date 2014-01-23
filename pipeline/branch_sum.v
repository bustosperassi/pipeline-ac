`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:35 12/02/2013 
// Design Name: 
// Module Name:    branch_sum 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module branch_sum  #(parameter PC_WIDE = 7)(
    input rst,
	 input [PC_WIDE - 1:0] pc_next,
    input [31:0] pc_branch,
    output reg [PC_WIDE - 1:0] branch_pc
    );
	 
	 always @(posedge rst) begin
		branch_pc <= 0;
	 end
	 
	 always @(pc_next, pc_branch) begin
		branch_pc = pc_next + pc_branch[PC_WIDE - 1:0];
	 end
	
endmodule
