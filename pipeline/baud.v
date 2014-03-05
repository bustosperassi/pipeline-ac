
//
// BAUD.v
//
// www.cmosexod.com
// 4/13/2001 (c) 2001
// Jeung Joon Lee
//
// This is the "baud-rate-genrator"
// The "baud_clk" is the output clock feeding the
// receiver and transmitter modules of the UART.
//
// By design, the purpose of the "baud_clk" is to 
// take in the "sys_clk" and generate a clock 
// which is 16 x BaudRate, where BaudRate is the
// desired UART baud rate.  
//
// Refer to "inc.h" for the setting of system clock
// and the desired baud rate.
//

module baud
		#(parameter 	XTAL_CLK = 100000000,//25175000 ,
		BAUD = 2400,
		CLK_DIV = XTAL_CLK / (BAUD * 16)
		) 
					
		(
		input sys_clk,
		output reg baud_clk				
		);



reg		[31:0]	clk_div /* syn keep = TRUE */;

//PARA SIMULAR
initial 
	begin
		clk_div=0;
		baud_clk=0;
end

always @(posedge sys_clk)
  if (clk_div == CLK_DIV) begin
    clk_div  <= 0;
    baud_clk <= 1;
  end else begin
    clk_div  <= clk_div + 1;
	 baud_clk <=0;
  end

endmodule
