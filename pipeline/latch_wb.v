`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:23 11/28/2013 
// Design Name: 
// Module Name:    latch_wb 
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
module latch_wb(
	 input clk,
    input reg_write,
    input mem_to_reg,
    output reg reg_write_reg,
    output reg memto_reg_reg
    );
	
	 always @(posedge clk) begin
			reg_write_reg <= reg_write;
			memto_reg_reg <= mem_to_reg;
	 end

endmodule
