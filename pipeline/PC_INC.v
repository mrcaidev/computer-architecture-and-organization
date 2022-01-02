`timescale 1ns / 1ps

module PC_INC(pc, pc_add_4);

input   [31:0]  pc;
output  [31:0]  pc_add_4;

CLA_32 add(pc, 4, 0, pc_add_4, Cout);

endmodule

