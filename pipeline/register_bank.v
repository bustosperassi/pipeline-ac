`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:30 06/08/2013 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(
    input load_store,
	 input alu_inm,
	 input branch,
	 input jump_abs,
	 input alu_reg,
	 input jump_rel,
	 input shift_var,
	 input shift,
	 output [31:0] busA,
    output [31:0] busB
    );

	reg [31:0] registros [31:0];
	
	always@(posedge load_store) begin
		
	end
	
	always@(posedge alu_inm) begin
		
	end
	
	always@(posedge branch) begin
		
	end
	
	always@(posedge jump_abs) begin
		
	end
	
	always@(posedge alu_reg) begin
		
	end
	
	always@(posedge jump_rel) begin
		
	end
	
	always@(posedge shift_var) begin
		
	end
	
	always@(posedge shift) begin
		
	end

endmodule
