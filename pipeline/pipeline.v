`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:58 12/06/2013 
// Design Name: 
// Module Name:    pipeline 
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

module pipeline(
		input clk,
		input rst,
		input enable
    );
	 
	 wire [6:0] pc_out;
	 wire pc_src;
	 wire [6:0] pc_branch_fetch ;
	 wire [31:0] DR;
	 
	 /* Bloque de busqueda de instruccion */
	fetch_stage ifetch (
		.clk(~clk), // conectado
		.dec(pc_src), // conectado
		.rst(rst), 
		.enbl(enable),
		.pc_mux(pc_branch_fetch), // conectado
		.pc_out(pc_out),  // conectado
		.DR(DR) // conectado
	); 
	 
	 /* Latch entre ifetch e idecode*/
	 wire [6:0] next_pc_reg;
	 wire [31:0] instruction_reg;
	 
	 latch_if_id if_id (
		.clk(clk), //conectado
		.rst(rst),
		.next_pc(pc_out), // conectado
		.instruction(DR), // conectado
		.next_pc_reg(next_pc_reg), //conectado
		.instruction_reg(instruction_reg) //conectado
	);
	
	/* bloque de etapa decode */
	 wire reg_write_in;
	 wire [4:0] WR;
	 wire [31:0] WD;
	 wire [31:0] data1;
	 wire [31:0] data2;
	 wire [31:0] ext_sig;
	 wire branch;
	 wire mem_read;
	 wire mem_write;
	 wire mem_to_reg;
	 wire reg_dst;
	 wire reg_write_out;
	 wire alu_src;
	 wire [5:0] alu_op;
	 
	 decode_stage decode (
		.clk(~clk), 
		.rst(rst),
		.reg_write_in(reg_write_in), // conectado
		.instruccion(instruction_reg), //conectado
		.WR(WR), // Conectado
		.WD(WD), // Conectado
		.data1(data1), // Conectado
		.data2(data2), // Conectado
		.ext_sig(ext_sig), // Conectado
		.branch(branch), // Conectado
		.mem_read(mem_read), // Conectado
		.mem_write(mem_write), // Conectado
		.mem_to_reg(mem_to_reg), // Conectado
		.reg_dst(reg_dst), // Conectado
		.reg_write_out(reg_write_out), // Conectado
		.alu_src(alu_src), // Conectado
		.alu_op(alu_op)// Conectado
	);
	
	/* Latch entre idecode e iexecute */
	 wire [31:0] data1_ex;
	 wire [31:0] data2_ex;
	 wire [31:0] sign_extend_ex;
	 wire branch_ex;
	 wire mem_read_ex;
	 wire mem_write_ex;
	 wire mem_to_reg_ex;
	 wire reg_dst_ex;
	 wire reg_write_ex;
	 wire alu_src_ex;
	 wire [5:0] alu_op_ex;
	 wire [6:0] pc_next_ex;
	 wire [4:0] reg1_ex;
	 wire [4:0] reg2_ex;
	
	latch_id_ex id_ex (
		.alu_op(alu_op), // Conectado
		.reg_dst(reg_dst), // Conectado
		.alu_src(alu_src), // Conectado
		.branch(branch), // Conectado
		.mem_write(mem_write), // Conectado
		.mem_read(mem_read), // Conectado
		.reg_write(reg_write_out), // Conectado 
		.mem_to_reg(mem_to_reg), // Conectado
		.pc_next(next_pc_reg), // conectado 
		.data1(data1), // Conectado
		.data2(data2), // Conectado
		.sign_extend(ext_sig), // Conectado 
		.reg1(instruction_reg[20:16]),  // Conectado
		.reg2(instruction_reg[15:11]), // Conectado
		.clk(clk), // Conectado
		.rst(rst),
		.alu_op_reg(alu_op_ex), //Conectado 
		.reg_dst_reg(reg_dst_ex), //Conectado
		.alu_src_reg(alu_src_ex), //Conectado 
		.branch_reg(branch_ex), //Conectado
		.mem_write_reg(mem_write_ex), //Conectado
		.mem_read_reg(mem_read_ex), //Conectado
		.reg_write_reg(reg_write_ex), //Conectado
		.mem_to_reg_reg(mem_to_reg_ex), //Conectado
		.pc_next_reg(pc_next_ex), //Conectado
		.data1_reg(data1_ex), //Conectado
		.data2_reg(data2_ex), //Conectado
		.sign_extend_reg(sign_extend_ex), //Conectado 
		.reg1_reg(reg1_ex), //Conectado
		.reg2_reg(reg2_ex) //Conectado
	);
	/* Wires de la unidad de cortocircuito */
	wire [1:0] cortoA;
	wire [1:0] cortoB;
	wire [31:0] cortoA_out;
	wire [31:0] cortoB_out;
	
	/* bloque de etapa execute */
	wire [6:0] branch_pc;
	wire zero;
	wire [31:0] alu_result;
	wire [31:0] data2_out;
	wire [4:0] dst;

	execute_stage execute (
		.rst(rst),
		.alu_src(alu_src_ex), //Conectado
		.alu_op(alu_op_ex), //Conectado
		.reg_dst(reg_dst_ex), //Conectado 
		.pc_next(pc_next_ex), //Conectado
		.data1(cortoA_out), //Conectado 
		.data2(cortoB_out), //Conectado
		.sign_extend(sign_extend_ex), //Conectado 
		.reg1(reg1_ex), //Conectado 
		.reg2(reg2_ex), //Conectado
		.branch_pc(branch_pc), //Conectado 
		.zero(zero), //Conectado
		.alu_result(alu_result), //Conectado
		.data2_out(data2_out), //Conectado
		.dst(dst) //Conectado
	);
	

	/* Latch etapa execute memory */
	wire mem_to_reg_m; 
   wire reg_write_m; 
	wire branch_m; 
	wire mem_write_m; 
	wire mem_read_m; 
	wire zero_m; 
	wire [31:0] alu_result_m; 
	wire [31:0] data2_m; 
	wire [4:0] dst_m;
	
	latch_ex_m ex_m (
		.mem_to_reg(mem_to_reg_ex), //Conectado
		.reg_write(reg_write_ex), //Conectado
		.branch(branch_ex), //Conectado
		.mem_write(mem_write_ex), //Conectado
		.mem_read(mem_read_ex), //Conectado
		.pc_branch(branch_pc), // conectado
		.zero(zero), //Conectado
		.alu_result(alu_result), //Conectado 
		.data2(data2_out), //Conectado 
		.dst(dst), //Conectado
		.clk(clk), //Conectado
		.rst(rst),
		.mem_to_reg_reg(mem_to_reg_m), //Conectado
		.reg_write_reg(reg_write_m), //Conectado
		.branch_reg(branch_m), //Conectado
		.mem_write_reg(mem_write_m), //Conectado
		.mem_read_reg(mem_read_m), 
		.pc_branch_reg(pc_branch_fetch), //Conectado
		.zero_reg(zero_m), //Conectado
		.alu_result_reg(alu_result_m), //Conectado
		.data2_reg(data2_m), //Conectado
		.dst_reg(dst_m) //Conectado
	);
	
	/* bloque de etapa memoria */
	wire [31:0] data_out;
	
	mem_stage mem (
		.no_clk(~clk), //Conectado
		.branch(branch_m), //Conectado
		.zero(zero_m), //Conectado  
		.mem_write(mem_write_m), //Conectado
		.address(alu_result_m), //Conectado 
		.write_data(data2_m), //Conectado 
		.data_out(data_out), //Conectado
		.pc_src(pc_src) //Conectado
	);
	
	/* Latch imem e iwb */
	wire mem_to_reg_wb;
	wire [31:0] alu_result_wb;
	wire [31:0] data_load_wb;
	
	latch_m_wb m_wb (
		.reg_write(reg_write_m), //Conectado 
		.mem_to_reg(mem_to_reg_m), //Conectado
		.alu_result(alu_result_m), //Conectado 
		.data_load(data_out), //Conectado 
		.dst(dst_m), //Conectado
		.clk(clk), //Conectado 
		.rst(rst),
		.reg_write_reg(reg_write_in), // conectado 
		.mem_to_reg_reg(mem_to_reg_wb), //Conectado
		.alu_result_reg(alu_result_wb), //Conectado
		.data_load_reg(data_load_wb), //Conectado
		.dst_reg(WR) // Conectado
	);
	
	/* bloque de etapa write back */
	
	wb_stage wb (
		.rst(rst),
		.mem_to_reg(mem_to_reg_wb), //Conectado 
		.data_in(data_load_wb), //Conectado 
		.dir(alu_result_wb), //Conectado 
		.data_out(WD) // Conectado
	);
	
	//_-_-_-_-_-_-_Unidad de Cortocircuito_-_-_-_-_-_-_-_//
	
	forwarding unidadCorto(
		.rs(instruction_reg[25:21]), 
		.rt(instruction_reg[20:16]), 
		.dst_mem(dst_m), 
		.dst_wb(WR), 
		.wb_mem(reg_write_m), 
		.wb_wb(reg_write_in), 
		.cortoA(cortoA), 
		.cortoB(cortoB)
	);
	
	mux4 rs_cortoA (
		.rst(rst),
		.in00(data1_ex), 
		.in01(alu_result_m), 
		.in02(WD), 
		.in03(alu_result_m), 
		.signal(cortoA), 
		.out_mux4(cortoA_out)
	);
	
	mux4 rt_cortoB (
		.rst(rst),
		.in00(data2_ex), 
		.in01(alu_result_m), 
		.in02(WD), 
		.in03(alu_result_m), 
		.signal(cortoB), 
		.out_mux4(cortoB_out)
	);

	//_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_//


endmodule
