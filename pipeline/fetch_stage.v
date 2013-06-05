`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:42 06/04/2013 
// Design Name: 
// Module Name:    fetch_stage 
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
module fetch_stage(
    input [6:0] pc_mux,
    output wire [6:0] pc_out,
    output wire [31:0] DR
    );
	 
	 wire [6:0] wire_pc;
	 wire [6:0] wire_inc;
	 reg [6:0] PC;
	 
	 
	 mem instruction_mem (
		.clka(clka), 
		.addra(addra), 
		.douta(DR)
	);

	
endmodule
