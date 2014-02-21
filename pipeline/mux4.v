`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:54 01/22/2014 
// Design Name: 
// Module Name:    mux4 
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
module mux4(
	 input rst,
    input [31:0] in00,
    input [31:0] in01,
    input [31:0] in02,
    input [31:0] in03,
    input [1:0] signal,
    output reg [31:0] out_mux4
    );

	always @(posedge rst) begin
		
	end

	always@(*) begin
		if (rst == 1) out_mux4 <= 0;
		else begin	
			 case(signal)
				2'b00: begin
							out_mux4 <= in00;
							end
				2'b01: begin
							out_mux4 <= in01;
							end
				2'b10: begin
							out_mux4 <= in02;
							end
				2'b11: begin
							out_mux4 <= in03;
							end
			endcase
		end
	end

endmodule
