`timescale 1ns/1ns
module tb_led ();
reg clk156_p ;
reg clk156_n ;
reg user_btn0;
reg user_btn1;
reg user_btn2;
reg user_btn3;
reg user_btn4;
wire user_led0;
wire user_led1;
wire user_led2;
wire user_led3;
wire user_led4;

always #10 clk156_p = ~clk156_p;
always #10 clk156_n = ~clk156_n;

led led(
.clk156_p (clk156_p ),
.clk156_n (clk156_n ),
.user_led4(user_led4),
.user_led3(user_led3),
.user_led2(user_led2),
.user_led1(user_led1),
.user_led0(user_led0),
.user_btn0(user_btn0),
.user_btn1(user_btn1),
.user_btn2(user_btn2),
.user_btn3(user_btn3),
.user_btn4(user_btn4)
	);

initial begin
	clk156_p = 0;
	clk156_n = 1;
	user_btn0 = 0;
	user_btn1 = 0;
	user_btn2 = 0;
	user_btn3 = 0;
	user_btn4 = 0;

	#10;
	user_btn1 = 1;
	user_btn2 = 1;

	#10;
	user_btn0 = 1;
	user_btn1 = 0;
	user_btn2 = 1;

	#10;
	user_btn3 = 1;
	user_btn4 = 1;
	
	#20;
	$finish;
end

endmodule : tb_led