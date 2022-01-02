`timescale 1ns / 1ps

module MUX32X32(Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32,S,Y);
input [31:0]Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32;
input [4:0]S;
output [31:0]Y;
function [31:0]select;
       input [31:0]Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32;
       input [4:0]S;
         case(S)
            5'b00000:select=Q0_reg32;
            5'b00001:select=Q1_reg32;
            5'b00010:select=Q2_reg32;
            5'b00011:select=Q3_reg32;
            5'b00100:select=Q4_reg32;
            5'b00101:select=Q5_reg32;
            5'b00110:select=Q6_reg32;
            5'b00111:select=Q7_reg32;
            5'b01000:select=Q8_reg32;
            5'b01001:select=Q9_reg32;
            5'b01010:select=Q10_reg32;
            5'b01011:select=Q11_reg32;
            5'b01100:select=Q12_reg32;
            5'b01101:select=Q13_reg32;
            5'b01110:select=Q14_reg32;
            5'b01111:select=Q15_reg32;
            5'b10000:select=Q16_reg32;
            5'b10001:select=Q17_reg32;
            5'b10010:select=Q18_reg32;
            5'b10011:select=Q19_reg32;
            5'b10100:select=Q20_reg32;
            5'b10101:select=Q21_reg32;
            5'b10110:select=Q22_reg32;
            5'b10111:select=Q23_reg32;
            5'b11000:select=Q24_reg32;
            5'b11001:select=Q25_reg32;
            5'b11010:select=Q26_reg32;
            5'b11011:select=Q27_reg32;
            5'b11100:select=Q28_reg32;
            5'b11101:select=Q29_reg32;
            5'b11110:select=Q30_reg32;
            5'b11111:select=Q31_reg32;
         endcase
endfunction
assign Y=select(Q31_reg32,Q30_reg32,Q29_reg32,Q28_reg32,Q27_reg32,Q26_reg32,Q25_reg32,Q24_reg32,Q23_reg32,Q22_reg32,Q21_reg32,Q20_reg32,Q19_reg32,Q18_reg32,Q17_reg32,Q16_reg32,Q15_reg32,Q14_reg32,Q13_reg32,Q12_reg32,Q11_reg32,Q10_reg32,Q9_reg32,Q8_reg32,Q7_reg32,Q6_reg32,Q5_reg32,Q4_reg32,Q3_reg32,Q2_reg32,Q1_reg32,Q0_reg32,S);
endmodule