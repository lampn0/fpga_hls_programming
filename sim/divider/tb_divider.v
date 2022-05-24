`timescale 1ns/1ns
module tb_divider #(
  parameter N = 4,
            C_BIT = $clog2(N)
  )();
reg 	      	clk     ;
reg 	      	reset_n ;
reg 	[N-1:0] devidend;
reg 	[N-1:0] devisor ;
reg 					start   ;
wire 	[N-1:0] quo     ;
wire 	[N-1:0] rem     ;
wire 	      	stop    ;	

always #10 clk = ~clk;

divider divider (
	.clk     (clk  		),
	.reset_n (reset_n	),
	.devidend(devidend),
	.devisor (devisor ),
	.start   (start   ),
	.quo     (quo			),
	.rem     (rem 		),
	.stop    (stop 		)
	);

initial begin
	clk = 0;
	reset_n = 1;
	#10;
	reset_n = 0;
	#10;
	reset_n = 1;
	#10;
	devidend = 4'd14;
	devisor  = 4'd4;
	start    = 1;
	#100;
	devidend = 4'd13;
	devisor  = 4'd3;
	#100;
	$finish;
end

endmodule : tb_divider