`timescale 1ns / 1ps

module forwarding(
    input [4:0] rs,
    input [4:0] rt,
	 input [4:0] dst_ex,
    input [4:0] dst_mem,
    input [4:0] dst_wb,
	 input wb_ex,
    input wb_mem,
    input wb_wb,
    output [1:0] cortoA,
    output [1:0] cortoB
    );

	// Los casos para corto:
	//					00 se elige el dato que viene del registro
	//					01 se elige el dato que viene de la etapa EX
	//					10 se elige el dato que viene de la etapa MEM
	//					11 se elige el dato que viene de la etapa WB

	wire x,y,z,i,j,k;

	assign x = ((rs[0]~^dst_ex[0]) & (rs[1]~^dst_ex[1]) & (rs[2]~^dst_ex[2]) & (rs[3]~^dst_ex[3]) & (rs[4]~^dst_ex[4])) & wb_ex;
	assign y = ((rs[0]~^dst_mem[0]) & (rs[1]~^dst_mem[1]) & (rs[2]~^dst_mem[2]) & (rs[3]~^dst_mem[3]) & (rs[4]~^dst_mem[4])) & wb_mem;
	assign z = ((rs[0]~^dst_wb[0]) & (rs[1]~^dst_wb[1]) & (rs[2]~^dst_wb[2]) & (rs[3]~^dst_wb[3]) & (rs[4]~^dst_wb[4])) & wb_wb;
	
	assign cortoA[0] = x | (z & ~y);
	assign cortoA[1] = ~x & (z | y);
	
	assign i = ((rt[0]~^dst_ex[0]) & (rt[1]~^dst_ex[1]) & (rt[2]~^dst_ex[2]) & (rt[3]~^dst_ex[3]) & (rt[4]~^dst_ex[4])) & wb_ex;
	assign j = ((rt[0]~^dst_mem[0]) & (rt[1]~^dst_mem[1]) & (rt[2]~^dst_mem[2]) & (rt[3]~^dst_mem[3]) & (rt[4]~^dst_mem[4])) & wb_mem;
	assign k = ((rt[0]~^dst_wb[0]) & (rt[1]~^dst_wb[1]) & (rt[2]~^dst_wb[2]) & (rt[3]~^dst_wb[3]) & (rt[4]~^dst_wb[4])) & wb_wb;

	assign cortoB[0] = i | (k & ~j);
	assign cortoB[1] = ~i & (k | j);
	
endmodule
