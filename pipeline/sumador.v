`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    23:52:47 06/04/2013 
// Design Name: 	 pipeline
// Module Name:    sumador 
// Description: Suma uno al PC
//////////////////////////////////////////////////////////////////////////////////
module sumador(
	 input clk,
    input [6:0] pc,
    output reg [6:0] pc_inc
    );
	 
	 wire [6:0] incremento = 1;

always@(posedge clk)
begin
	pc_inc = pc+incremento;
end
endmodule
