`timescale 1ns / 1ps

module REG_ID_EX(D13,D0,D1,D2,D3,D4,D5,D7,D8,D9,D10,En,Clk,Clrn,Q0,Q1,Q2,Q3,Q4,Q5,Q7,Q8,Q9,Q10,D11,D12,Q11,Q12,stall,Q13,condep);

input   [31:0]  D7,D8,D9,D13;
input   [5:0]   D3;
input   [4:0]   D10;
input   [1:0]   D4, D11, D12;
input           D0, D1, D2, D5;
input           En, Clk, Clrn, stall, condep;
output  [31:0]  Q7,Q8,Q9,Q13;
output  [5:0]   Q3;
output  [4:0]   Q10;
output  [1:0]   Q4, Q11, Q12;
output          Q0, Q1, Q2, Q5;

wire            Clrn_SC = Clrn & ~stall & ~condep;

D_FFEC_POS      q0(D0,Clk,En,Clrn_SC,Q0);
D_FFEC_POS      q1(D1,Clk,En,Clrn_SC,Q1);
D_FFEC_POS      q2(D2,Clk,En,Clrn_SC,Q2);
D_FFEC_POS_6    q3(D3,Clk,En,Clrn_SC,Q3);
D_FFEC_POS_2    q4(D4,Clk,En,Clrn_SC,Q4);
D_FFEC_POS      q5(D5,Clk,En,Clrn_SC,Q5);
D_FFEC_POS_32   q7(D7,Clk,En,Clrn_SC,Q7);
D_FFEC_POS_32   q8(D8,Clk,En,Clrn_SC,Q8);
D_FFEC_POS_32   q9(D9,Clk,En,Clrn_SC,Q9);
D_FFEC_POS_5    q10(D10,Clk,En,Clrn_SC,Q10);
D_FFEC_POS_2    q11(D11,Clk,En,Clrn_SC,Q11);
D_FFEC_POS_2    q12(D12,Clk,En,Clrn_SC,Q12);
D_FFEC_POS_32   q13(D13,Clk,En,Clrn_SC,Q13);

endmodule
