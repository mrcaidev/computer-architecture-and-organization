`timescale 1ns / 1ps

module D_FFEC_POS_5(D, Clk, En, Clrn, Q, Qn);

input   [4:0]   D;
input           Clk, En, Clrn;
output  [4:0]   Q, Qn;

D_FFEC_POS  d0(D[0], Clk, En, Clrn, Q[0], Qn[0]);
D_FFEC_POS  d1(D[1], Clk, En, Clrn, Q[1], Qn[1]);
D_FFEC_POS  d2(D[2], Clk, En, Clrn, Q[2], Qn[2]);
D_FFEC_POS  d3(D[3], Clk, En, Clrn, Q[3], Qn[3]);
D_FFEC_POS  d4(D[4], Clk, En, Clrn, Q[4], Qn[4]);

endmodule
