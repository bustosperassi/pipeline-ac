`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    11:12:01 12/01/2013 
// Design Name: 
// Module Name:    wb_stage 
// Project Name:   pipeline-ac
// Target Devices: 
// Tool versions: 
// Description: Etapa write back, se podria solamente haber instanciado un mux
//					 y con eso ya se resolvia la etapa, pero para una mayor claridad 
//					 se "encapsulo" en este modulo que al fin y al cabo es un
//					 multiplexor de 32 bits.
//////////////////////////////////////////////////////////////////////////////////
module wb_stage(
    input mem_to_reg,
    input [31:0] data_in,
    input [31:0] dir,
    output [31:0] data_out
    );
	 
	 mux #(.nbits(32)) wb_mux(
		.msb(data_in), 
		.lsb(dir), 
		.out(data_out), 
		.dec(mem_to_reg)
	);

endmodule
