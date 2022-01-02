`timescale 1ns / 1ps

module REG_IF_ID(D0, D1, En, Clk, Clrn, Q0, Q1, stall, condep);

input   [31:0]  D0, D1;
input           En, Clk, Clrn, stall, condep;
output  [31:0]  Q0, Q1;

wire            En_S   = En & ~stall;
wire            Clrn_C = Clrn & ~condep;

D_FFEC_POS_32   q0(D0, Clk, En_S, Clrn_C, Q0);
D_FFEC_POS_32   q1(D1, Clk, En_S, Clrn_C, Q1);

endmodule
