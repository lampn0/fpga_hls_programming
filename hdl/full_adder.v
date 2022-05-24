/*
 *-----------------------------------------------------------------------------
 *     Copyright (C) 2022 by Dolphin Technology
 *     All right reserved.
 *
 *     Copyright Notification
 *     No part may be reproduced except as authorized by written permission.
 *
 *     Module/Class: full_adder
 *     Project     : fpga_hls_programming
 *     Author      : lampn0
 *     Created     : 2022-19-05 20:04:18
 *     Description :
 *
 *     @Last Modified by:   lampn0
 *     @Last Modified time: 2022-19-05 20:04:18
 *-----------------------------------------------------------------------------
 */
module full_adder (
  input       a     ,
  input       b     ,
  input       c_in  ,
  output wire s     ,
  output wire c_out
);

assign s = a ^ b ^ c;
assign c_out = (a&b) | (b&c) | (c&a);

endmodule : full_adder