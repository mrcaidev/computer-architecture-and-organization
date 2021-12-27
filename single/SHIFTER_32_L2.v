`timescale 1ns / 1ps

// Shifter shifting 2 left. (32-bits)
module SHIFTER_32_L2(X, Sh);

    input [31:0] X;
    output [31:0] Sh;

    SHIFTER_32 shifter (X, 5'b00010, 1'b0, 1'b0, Sh);

endmodule