`timescale 1ns / 1ps

module CLA_4 (X, Y, Cin, S, Cout);

input   [3:0]   X, Y;
input           Cin;
output  [3:0]   S;
output          Cout;

wire    [3:0]   G = X & Y, P = X | Y;
wire    [2:0]   temp_Cout;

// Carry of each bit.
assign Cout         = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
assign temp_Cout[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
assign temp_Cout[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin)  ;
assign temp_Cout[0] = G[0] | (P[0] & Cin)  ;

// Sum of each bit.
assign S[3] = X[3] ^ Y[3] ^ temp_Cout[2];
assign S[2] = X[2] ^ Y[2] ^ temp_Cout[1];
assign S[1] = X[1] ^ Y[1] ^ temp_Cout[0];
assign S[0] = X[0] ^ Y[0] ^ Cin;

endmodule
