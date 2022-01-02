`timescale 1ns / 1ps

module D_FFEC_POS_2(D, Clk, En, Clrn, Q, Qn);

input   [1:0]   D;
input           Clk, En, Clrn;
output  [1:0]   Q, Qn;

D_FFEC_POS  d0(D[0], Clk, En, Clrn, Q[0], Qn[0]);
D_FFEC_POS  d1(D[1], Clk, En, Clrn, Q[1], Qn[1]);

endmodule
