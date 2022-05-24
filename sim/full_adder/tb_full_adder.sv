`timescale 1ns/1ns
module tb_full_adder ();
reg  a    ;
reg  b    ;
reg  c_in ;
wire s    ;
wire c_out;

full_adder full_adder(
	.a    (a),
	.b    (b),
	.c_in (c_in),
	.s    (s),
	.c_out(c_out)
	);

initial begin
	a = 1;
	b = 1;
	c_in = 1;
	#5;
	a = 0;
	b = 1;
	c_in = 1;
	#5;
	a = 1;
	b = 0;
	c_in = 0;
	#5;
	$finish;
end

endmodule : tb_full_adder