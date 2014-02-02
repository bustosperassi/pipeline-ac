`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:47 02/02/2014 
// Design Name: 
// Module Name:    flag_buf 
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
module flag_buf #(parameter W=8)
	( input wire clk, reset,
	  input wire clr_flag, set_flag,
	  input wire [W-1:0] din,
	  output wire flag,
	  output wire [W-1:0] dout
    );

	reg [W-1:0] buf_reg, buf_next;
	reg flag_reg, flag_next;
	
	always @(posedge clk, posedge reset) begin
		if(reset) begin
			buf_reg <= 0;
			flag_reg <= 1'b0;
		end
		else begin
			buf_reg <= buf_next;
			flag_reg <= flag_next;
		end
	end
	
	always @(*) begin
		buf_next = buf_reg;
		flag_next = flag_reg;
		if(set_flag) begin
			buf_next = din;
			flag_next = 1'b0;
		end
		else if(clr_flag) begin
			flag_next = 1'b0;
		end
	end
	
	assign dout = buf_reg;
	assign flag = flag_reg;
	
endmodule
