`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:33 12/06/2013 
// Design Name: 
// Module Name:    mem_stage 
//////////////////////////////////////////////////////////////////////////////////
module mem_stage(
	 input no_clk,
	 input branch,
    input zero,
	 input mem_write,
    input [31:0] address,
    input [31:0] write_data,
    output [31:0] data_out,
    output pc_src
    );
	 
	 data_memory memoria_datos (
		.clka(no_clk), 
		.wea(mem_write), 
		.addra(address[9:0]), 
		.dina(write_data), 
		.douta(data_out)
	 );
	 
	 assign pc_src = zero & branch;
	 
endmodule