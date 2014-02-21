`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:12 11/28/2013 
// Design Name: 
// Module Name:    latch_m 
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
module latch_m(
	 input clk,
	 input rst,
    input mem_write,
    input mem_read,
    input branch,
    output reg mem_write_reg,
    output reg mem_read_reg,
    output reg branch_reg
    );

	always @(posedge clk) begin
		if (rst == 1) begin
			mem_write_reg	<= 0;
			mem_read_reg 	<= 0;
			branch_reg 		<= 0;
		end
		else begin
			mem_write_reg	<= mem_write;
			mem_read_reg 	<= mem_read;
			branch_reg 		<= branch;
		end
	end	
	
endmodule
