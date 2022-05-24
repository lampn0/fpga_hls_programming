/*
 *-----------------------------------------------------------------------------
 *     Copyright (C) 2022 by Dolphin Technology
 *     All right reserved.
 *
 *     Copyright Notification
 *     No part may be reproduced except as authorized by written permission.
 *
 *     Module/Class: led
 *     Project     : fpga_hls_programming
 *     Author      : lampn0
 *     Created     : 2022-19-05 20:04:18
 *     Description :
 *
 *     @Last Modified by:   lampn0
 *     @Last Modified time: 2022-19-05 20:04:18
 *-----------------------------------------------------------------------------
 */

//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------
module led (
  input  wire clk156_p ,
  input  wire clk156_n ,
  input  wire user_btn0,
  input  wire user_btn1,
  input  wire user_btn2,
  input  wire user_btn3,
  input  wire user_btn4,
  output wire user_led0,
  output wire user_led1,
  output wire user_led2,
  output wire user_led3,
  output wire user_led4
);

//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

wire sys_clk;
wire sys_rst;
wire por_clk;
wire clk_se;
reg  int_rst = 1'd1;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign user_led0 = user_btn0;
assign user_led1 = user_btn1;
assign user_led2 = user_btn2;
assign user_led3 = user_btn3;
assign user_led4 = user_btn4;
assign sys_clk = clk_se;
assign por_clk = clk_se;
assign sys_rst = int_rst;

//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------

always @(posedge por_clk) begin
  int_rst <= 1'd0;
end

always @(posedge sys_clk) begin
  if (sys_rst) begin
  end
end


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

IBUFDS IBUFDS(
  .I(clk156_p),
  .IB(clk156_n),
  .O(clk_se)
);

endmodule : led