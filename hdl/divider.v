/*
 *-----------------------------------------------------------------------------
 *     Copyright (C) 2022 by Dolphin Technology
 *     All right reserved.
 *
 *     Copyright Notification
 *     No part may be reproduced except as authorized by written permission.
 *
 *     Module/Class: divider
 *     Project     : fpga_hls_programming
 *     Author      : lampn0
 *     Created     : 2022-19-05 20:04:18
 *     Description :
 *
 *     @Last Modified by:   lampn0
 *     @Last Modified time: 2022-19-05 20:04:18
 *-----------------------------------------------------------------------------
 */
module divider #(
  parameter N = 4,
            C_BIT = $clog2(N)
  )
  (
  input               clk     , // Clock
  input               reset_n , // Asynchronous reset active low
  input       [N-1:0] devidend,
  input       [N-1:0] devisor ,
  input               start   ,
  output wire [N-1:0] quo     ,
  output wire [N-1:0] rem     ,
  output reg          stop    
);

localparam [1:0]  idle_state = 2'b00, 
                  loop_state = 2'b01, 
                  last_state = 2'b10, 
                  stop_state = 2'b11;

reg [       1:0 ] current_state  ;
reg [       1:0 ] next_state     ;
reg [     N-1:0 ] reg_devidend   ;
reg [     N-1:0 ] next_devidend  ;
reg [     N-1:0 ] tmp_devidend   ;
reg [     N-1:0 ] reg_devisor    ;
reg [     N-1:0 ] next_devisor   ;
reg [     N-1:0 ] reg_rem        ;
reg [     N-1:0 ] next_rem       ; 
reg [     N-1:0 ] tmp_rem        ;
reg [ C_BIT-1:0 ] reg_count      ;
reg [ C_BIT-1:0 ] next_count     ;
reg               q_bit          ;

always @(posedge clk or negedge reset_n) begin 
  if(~reset_n) begin
    current_state <= 0;
    reg_devisor <= 0;
    reg_devidend <= 0;
    reg_rem <= 0;
    reg_count <= 0;
  end else begin
    current_state <= next_state;
    reg_devisor <= next_devisor;
    reg_devidend <= next_devidend;
    reg_rem <= next_rem;
    reg_count <= next_count;
  end
end

always @(*) begin 
  case (current_state)
  idle_state: begin 
    if (start) begin
      next_devidend = devidend;
      next_devisor = devisor;
      next_rem = 0;
      next_count = N;
      next_state = loop_state;
    end
  end

  loop_state: begin 
    next_devidend = {reg_devidend[N-2:0], q_bit};
    next_rem = {tmp_rem[N-2:0], reg_devidend[N-1]};
    next_count = reg_count - 1;
    if (next_count == 1) begin
      next_state = last_state;
    end
  end

  last_state: begin 
    next_devidend = { reg_devidend[N-2], q_bit};
    next_rem = tmp_rem;
    next_state = stop_state;
  end

  stop_state: begin 
    stop = 1;
    next_state = idle_state;
  end

    default : next_state = idle_state;
  endcase
end

always @(*) begin
  if(reg_rem > reg_devisor) begin
    q_bit = 1;
    tmp_rem = reg_rem - reg_devisor;
  end
  else begin 
    tmp_rem = reg_rem;
    q_bit = 0;
  end
end

endmodule : divider