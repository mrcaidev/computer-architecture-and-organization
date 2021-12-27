`timescale 1ns / 1ps

// Extend 16-bits data to 32-bits.
module EXT16T32 (X, Se, Y);

    input [15:0] X;
    input Se;
    output [31:0] Y;

    MUX2X32 select({16'b0, X}, {{16{X[15]}}, X}, Se, Y);

endmodule
