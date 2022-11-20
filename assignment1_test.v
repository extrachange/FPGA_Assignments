/*
Copyright © 2022 <1039200323段立言>
Date:2022/11/20
Class:自动化2003
FPGA第一次作业_testbench
以MIT协议授权
*/

`timescale 1ns/1ns

module test;

reg [7:0] a;


wire [6:0] led1;
wire [2:0] codec;

parameter T = 10;

assignment_1 u_a(
	.input8 (a),
	
	.led1 (led1),   
	.codec (codec)
);
//测试 00000000-10000000的输入，00000000的输入是无意义的
initial begin
	a =8'b00000000;

	
	#(T) begin
	a =8'b00000001;

	end
	
	#(T) begin
	a =8'b00000010;

	end
	
	#(T) begin
	a =8'b10000100;

	end
	
	#(T) begin
	a =8'b00001000;

	end
	
	#(T) begin
	a =8'b00010000;

	end
	
		#(T) begin
	a =8'b00100000;

	end
	
		#(T) begin
	a =8'b01000000;

	end
	
		#(T) begin
	a =8'b10000000;

	end
	
end

endmodule	