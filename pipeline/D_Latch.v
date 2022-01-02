`timescale 1ns / 1ps

module D_Latch(D,En,Q,Qn);

input   D, En;
output  Q, Qn;

wire    Sn, Rn, Dn;

not     i0(Dn, D);
nand    i1(Sn, D, En);
nand    i2(Rn, En, Dn);
nand    i3(Q, Sn, Qn);
nand    i4(Qn, Q, Rn);

endmodule
