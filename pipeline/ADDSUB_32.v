`timescale 1ns / 1ps

module ADDSUB_32(X, Y, Sub, S, Cout);

input   [31:0]  X, Y;
input           Sub;
output  [31:0]  S;
output          Cout;

CLA_32  add(X, Y^{32{Sub}}, Sub, S, Cout);

endmodule
