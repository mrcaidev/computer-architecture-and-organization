`timescale 1ns / 1ps

module SHIFTER_32_L2(X, Sh);

input   [31:0]  X;
output  [31:0]  Sh;

assign Sh = {X[29:0], 2'b00};

endmodule
