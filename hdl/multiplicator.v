/*
 *-----------------------------------------------------------------------------
 *     Copyright (C) 2022 by Dolphin Technology
 *     All right reserved.
 *
 *     Copyright Notification
 *     No part may be reproduced except as authorized by written permission.
 *
 *     Module/Class: multiplicator
 *     Project     : fpga_hls_programming
 *     Author      : lampn0
 *     Created     : 2022-19-05 20:04:18
 *     Description :
 *
 *     @Last Modified by:   lampn0
 *     @Last Modified time: 2022-19-05 20:04:18
 *-----------------------------------------------------------------------------
 */
module multiplicator (
  input       [3:0] a,
  input       [3:0] b,
  output wire [7:0] m  
);

wire [3:0] m0;
wire [4:0] m1;
wire [5:0] m2;
wire [6:0] m3;

wire [7:0] s1,s2,s3;

assign m0 = {4{a[0]}} & b[3:0];
assign m1 = {4{a[1]}} & b[3:0];
assign m2 = {4{a[2]}} & b[3:0];
assign m3 = {4{a[3]}} & b[3:0];

assign s1 = m0 + (m1<<1);
assign s2 = s1 + (m2<<2);
assign s3 = s2 + (m3<<3);
assign m  = s3;

endmodule : multiplicator