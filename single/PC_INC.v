`timescale 1ns / 1ps

module PC_INC(pc, pc_inc);

    input [31:0] pc;
    output [31:0] pc_inc;

    CLA_32 cla32(pc, 4, 0, pc_inc, Cout);

endmodule