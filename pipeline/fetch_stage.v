`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:32:42 06/04/2013 
// Module Name:    fetch_stage 
// Project Name:   pipeline 
// Additional Comments: Etapa de busqueda de instruccion en memoria
//								Tiene de salida la propia instruccion
//////////////////////////////////////////////////////////////////////////////////
module fetch_stage(
	 input clk,
	 input dec,
	 input rst,
	 input enbl,
    input [6:0] pc_mux,
    output [6:0] pc_out,
    output [31:0] DR,
	 output bubble
    );
	 
	 // Declaracion de senales internas
	 wire [6:0] pc_next;
	 wire [6:0] pc_in;
	 wire [1:0] flag;
	 wire stop_branch;
	 wire enable; // Es el enable que se le manda al sumador.
	 assign enable = (enbl & (~stop_branch));
	 reg [6:0] PC;
	 
	 mem instruction_mem (
		.clka(clk), 
		.addra(PC), 
		.douta(DR)
	);
	
	mux_program_counter mux1(
		.rst(rst),
		.dec(dec),
		.msb(pc_mux),
		.lsb(pc_next),
		.out(pc_in)
	);
	
	sumador sum (
		.pc(PC), 
		.pc_inc(pc_next)
	);
	
	branch_detection branches (
		.clk(~clk), 
		.rst(rst),
		.instruccion(DR[31:26]),
		.stop(stop_branch),
		.bubble(bubble),
		.flag_reg(flag)
	);
	assign pc_out = pc_next;
	
	always @(negedge clk) begin
		if (rst == 1) PC <= 0;
		else begin
			if (enable)PC <= pc_in;
			else if (flag == 1) PC <= PC - 1;
		end
	end
	
endmodule
