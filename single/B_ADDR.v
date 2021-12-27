`timescale 1ns / 1ps

// Get address of beq and bne.
module B_ADDR (pc_add_4, immediate, B_Addr);

    input [31:0] immediate;
    input [31:0] pc_add_4;
    output [31:0] B_Addr;
    
    wire Cout;
    wire [31:0] immediate_left_2;

    SHIFTER_32_L2 shift_addr_left_2(immediate, immediate_left_2);
    CLA_32 cla_32(pc_add_4, immediate_left_2, 1'b0, B_Addr, Cout);

endmodule