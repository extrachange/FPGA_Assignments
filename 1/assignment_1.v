/*
Copyright © 2022 <1039200323段立言>
Date:2022/11/20
Class:自动化2003
FPGA第一次作业
以MIT协议授权
*/
module assignment_1(
input [7:0] input8,	//输入8位线路
output [3:0] codec,	//编码后的值
output [6:0] led1   	//输出至7段LED数码管

);

wire [3:0] coded8;
wire [3:0] coded8to4;
 
assign coded8to4[0] = coded8[0];
assign coded8to4[1] = coded8[1];
assign coded8to4[2] = coded8[2];
assign coded8to4[3] = 0;
//以上代码将3位的编码器输出转换为4位，高位置0
assign codec = coded8;

//例化编码器及译码器
encoder_8_3 u_encoder_8_3(
	.in (input8),
	.out (coded8)

);

y_m u_y_m1(
	.num (coded8to4),
	.a_g (led1)
);


endmodule

//编码器
module encoder_8_3(
    input   [7:0]   in,
    output  [2:0]   out
);
    assign out = ({3{in[0]}} & 3'd0) 
                |({3{in[1]}} & 3'd1)
                |({3{in[2]}} & 3'd2)
                |({3{in[3]}} & 3'd3)
                |({3{in[4]}} & 3'd4)
                |({3{in[5]}} & 3'd5)
                |({3{in[6]}} & 3'd6)
                |({3{in[7]}} & 3'd7);
endmodule

//译码器
module y_m(num,a_g);
	input[3:0]    num;
	output[6:0]   a_g;
	reg[6:0]      a_g;
	always@(num)begin
		case(num)
			4'd0:a_g<=7'b111_1110;
			4'd1:a_g<=7'b011_0000;
			4'd2:a_g<=7'b110_1101;
			4'd3:a_g<=7'b111_1100;
			4'd4:a_g<=7'b011_0011;
			4'd5:a_g<=7'b101_1011;
			4'd6:a_g<=7'b101_1111;
			4'd7:a_g<=7'b111_0000;
			4'd8:a_g<=7'b111_1111;
			4'd9:a_g<=7'b111_1011;
		endcase
	end
endmodule
