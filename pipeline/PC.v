`timescale 1ns / 1ps

module PC(IF_Result, Clk, En, Clrn, IF_Addr, stall);

input   [31:0]  IF_Result;
input           Clk, En, Clrn, stall;
output  [31:0]  IF_Addr;

wire En_S = En & ~stall;

D_FFEC_POS_32 pc(IF_Result, Clk, En_S, Clrn, IF_Addr);

endmodule
