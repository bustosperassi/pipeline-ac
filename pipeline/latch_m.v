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
    input branch,
    output reg mem_write_reg,
    output reg branch_reg
    );

	always @(posedge clk) begin
		if (rst == 1) begin
			mem_write_reg	<= 0;
			branch_reg 		<= 0;
		end
		else begin
			mem_write_reg	<= mem_write;
			branch_reg 		<= branch;
		end
	end	
	
endmodule
