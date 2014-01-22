`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:14 01/21/2014 
// Design Name: 
// Module Name:    forwarding 
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
module forwarding(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] dst_mem,
    input [4:0] dst_wb,
    input wb_mem,
    input wb_wb,
    output [1:0] cortoA,
    output [1:0] cortoB
    );

	// Los casos:
	//					00 se elige el dato que viene del registro
	//					01 se elige el dato que viene de la etapa MEM
	//					10 se elige el dato que viene de la etapa WB
	//					11 se elige el dato que viene de la etapa MEM

	assign cortoA[0] = ((rs[0]~^dst_mem[0]) & (rs[1]~^dst_mem[1]) & (rs[2]~^dst_mem[2]) & (rs[3]~^dst_mem[3]) & (rs[4]~^dst_mem[4])) & wb_mem;
	assign cortoA[1] = ((rs[0]~^dst_wb[0]) & (rs[1]~^dst_wb[1]) & (rs[2]~^dst_wb[2]) & (rs[3]~^dst_wb[3]) & (rs[4]~^dst_wb[4])) & wb_wb;
	
	assign cortoB[0] = ((rt[0]~^dst_mem[0]) & (rt[1]~^dst_mem[1]) & (rt[2]~^dst_mem[2]) & (rt[3]~^dst_mem[3]) & (rt[4]~^dst_mem[4])) & wb_mem;
	assign cortoB[1] = ((rt[0]~^dst_wb[0]) & (rt[1]~^dst_wb[1]) & (rt[2]~^dst_wb[2]) & (rt[3]~^dst_wb[3]) & (rt[4]~^dst_wb[4])) & wb_wb;

endmodule
