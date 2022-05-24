`timescale 1ns/1ns
module tb_multiplicator ();
reg  [3:0] a;
reg  [3:0] b;
wire [7:0] m;

multiplicator multoplicator(
	.a(a),
	.b(b),
	.m(m)
	);

initial begin
	a = 1001;
	b = 1101;
	#10;
	a = 0011;
	b = 0101;
	#10;
	a = 1111;
	b = 1111;
	#10;
	$finish;
end

endmodule : tb_multiplicator
