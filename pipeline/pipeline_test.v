`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:33:51 12/10/2013
// Design Name:   pipeline
// Module Name:   /home/nico/pipeline-ac/pipeline/pipeline_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipeline_test;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	
	// Outputs
	wire [31:0] instruccion; 
	wire [7:0] pc;
	wire [39:0] if_id; //1'b0, [38:32] next_pc_if_id, [31:0] instruction_if_id
	wire [143:0] id_ex; //2'b0, [5:0] alu_op_id_ex, 3'b0, reg_dst_id_ex, alu_src_id_ex, mem_write_id_ex, reg_write_id_ex, mem_to_reg_id_ex, [31:0] data1_id_ex, [31:0] data2_id_ex, [31:0] sign_extend_id_ex, 3'b0, [4:0] reg1_id_ex, 3'b0, [4:0] reg2_id_ex , 3'b0, [4:0] rs_id_ex, 3'b0, [4:0] rt_id_ex
	wire [79:0] ex_m; //5'b0, mem_to_reg_ex_m,reg_write_ex_m,mem_write_ex_m,[31:0] alu_result_ex_m,[31:0] data2_ex_m, 3'b0, [4:0] dst_ex_m
	wire [79:0] m_wb; //6'b0, reg_write_m_wb,mem_to_reg_m_wb,[31:0] alu_result_m_wb,[31:0] data_load_m_wb, 3'b0, [4:0] dst_m_wb
	wire [1023:0] registros;

	// Instantiate the Unit Under Test (UUT)
	pipeline uut (
		.clk(clk),
		.rst(rst),
		.enable(enable),
		.instruccion(instruccion), 
		.pc(pc),
		.if_id(if_id), //1'b0, [38:32] next_pc_if_id, [31:0] instruction_if_id
		.id_ex(id_ex), //2'b0, [5:0] alu_op_id_ex, 3'b0, reg_dst_id_ex, alu_src_id_ex, mem_write_id_ex, reg_write_id_ex, mem_to_reg_id_ex, [31:0] data1_id_ex, [31:0] data2_id_ex, [31:0] sign_extend_id_ex, 3'b0, [4:0] reg1_id_ex, 3'b0, [4:0] reg2_id_ex , 3'b0, [4:0] rs_id_ex, 3'b0, [4:0] rt_id_ex
		.ex_m(ex_m), //5'b0, mem_to_reg_ex_m,reg_write_ex_m,mem_write_ex_m,[31:0] alu_result_ex_m,[31:0] data2_ex_m, 3'b0, [4:0] dst_ex_m
		.m_wb(m_wb), //6'b0, reg_write_m_wb,mem_to_reg_m_wb,[31:0] alu_result_m_wb,[31:0] data_load_m_wb, 3'b0, [4:0] dst_m_wb
		.registros(registros)
	);

	initial begin
		// Initialize Inputs

		rst = 1;
		enable = 0;
		
		#100;
      clk = 0;
		
		#100;
      clk = 1;
		rst = 0;
		enable = 1;
		
		#100;
      clk = 0;
		
		#100;
      clk = 1;
		#100;
      clk = 0;
		#100;
      clk = 1;
		#100;
      clk = 0;
		#100;
      clk = 1;

		forever
		#100 clk = ~clk;
	end
      
endmodule

