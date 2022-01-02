`timescale 1ns / 1ps

module D_FFEC_POS(D, Clk, En, Clrn, Q, Qn);

input   D, Clk, En, Clrn;
output  Q, Qn;

wire    Y0, Y_C;

MUX2X1      m0(Q, D, En, Y0);
and         i0(Y_C, Y0, Clrn);
D_FF_POS    d0(Y_C, Clk, Q, Qn);

endmodule
