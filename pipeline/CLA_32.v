`timescale 1ns / 1ps

module CLA_32 (X, Y, Cin, S, Cout);

input   [31:0]  X, Y;
input           Cin;
output  [31:0]  S;
output          Cout;

wire    [6:0]   temp_Cout;

// Apply CLA_4 to every 4 bits of X and Y.
CLA_4   add0(X[3:0]  , Y[3:0]  , Cin         , S[3:0]  , temp_Cout[0]);
CLA_4   add1(X[7:4]  , Y[7:4]  , temp_Cout[0], S[7:4]  , temp_Cout[1]);
CLA_4   add2(X[11:8] , Y[11:8] , temp_Cout[1], S[11:8] , temp_Cout[2]);
CLA_4   add3(X[15:12], Y[15:12], temp_Cout[2], S[15:12], temp_Cout[3]);
CLA_4   add4(X[19:16], Y[19:16], temp_Cout[3], S[19:16], temp_Cout[4]);
CLA_4   add5(X[23:20], Y[23:20], temp_Cout[4], S[23:20], temp_Cout[5]);
CLA_4   add6(X[27:24], Y[27:24], temp_Cout[5], S[27:24], temp_Cout[6]);
CLA_4   add7(X[31:28], Y[31:28], temp_Cout[6], S[31:28], Cout        );

endmodule