`timescale 1ns / 1ps

module ALU(X, Y, Aluc, R, Z);

input   [31:0]  X, Y;
input   [1:0]   Aluc;
output  [31:0]  R;
output          Z;

wire    [31:0]  d_add_sub, d_and_or;

ADDSUB_32   as(X, Y, Aluc[0], d_add_sub);

MUX2X32 select1(X & Y, X | Y, Aluc[0], d_and_or);
MUX2X32 select2(d_add_sub, d_and_or, Aluc[1], R);

assign Z = ~|R;

endmodule