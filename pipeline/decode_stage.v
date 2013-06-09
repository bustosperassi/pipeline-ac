`timescale 1ns / 1ps
////////////////////////////////////////////////
// Module Name:    decode_stage 
// Description: 	Etapa de decodificacion de
//						de la instruccion que proviene
//						desde la etapa fetch.
////////////////////////////////////////////////
module decode_stage(
    input [31:0] DR,
    input [31:0] WB,
    output [4:0] bus_A,
    output [4:0] bus_B,
    output [31:0] ext_sig
    ); 
endmodule