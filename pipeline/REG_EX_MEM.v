`timescale 1ns / 1ps

module REG_EX_MEM(D0, D1, D2, D3, D4, D5, En, Clk, Clrn, Q0, Q1, Q2, Q3, Q4, Q5);

input           D0, D1, D2;
input   [31:0]  D3,D4;
input   [4:0]   D5;

output          En, Clk, Clrn;
output          Q0, Q1, Q2;
output [31:0]   Q3, Q4;
output [4:0]    Q5;


D_FFEC_POS      q0(D0, Clk, En, Clrn, Q0);
D_FFEC_POS      q1(D1, Clk, En, Clrn, Q1);
D_FFEC_POS      q2(D2, Clk, En, Clrn, Q2);
D_FFEC_POS_32   q3(D3, Clk, En, Clrn, Q3);
D_FFEC_POS_32   q4(D4, Clk, En, Clrn, Q4);
D_FFEC_POS_5    q5(D5, Clk, En, Clrn, Q5);

endmodule
