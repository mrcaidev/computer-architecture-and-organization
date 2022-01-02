`timescale 1ns / 1ps


module REGFILE(Ra, Rb, D, Wr, We, Clk, Clrn, Qa, Qb);

input   [4:0]   Ra, Rb, Wr;
input   [31:0]  D;
input           We, Clk, Clrn;
output  [31:0]  Qa, Qb;

wire    [31:0]  Sel, Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0;

DEC5T32E    dec(Wr, We, Sel);
REG_32      i0(D, Sel, Clk, Clrn, Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0);
MUX32X32    select1(Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0, Ra, Qa);
MUX32X32    select2(Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0, Rb, Qb);

endmodule

