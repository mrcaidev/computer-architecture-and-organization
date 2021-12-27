`timescale 1ns / 1ps

// Get address of J-instructions.
module J_ADDR (pc_add_4, Addr, J_Addr);

    input [31:0] pc_add_4;
    input [25:0] Addr;
    output [31:0] J_Addr;

    assign J_Addr = {pc_add_4[31:28], Addr, 2'b00};

endmodule