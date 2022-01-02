`timescale 1ns / 1ps

module D_FF_NEG(D, Clk, Q, Qn);

input   D, Clk;
output  Q, Qn;

wire    Clkn, Q0, Qn0;

not     i0(Clkn, Clk);
D_Latch d0(D, Clk, Q0, Qn0);
D_Latch d1(Q0, Clkn, Q, Qn);

endmodule
