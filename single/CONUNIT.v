`timescale 1ns / 1ps

// Control unit.
module CONUNIT(Op, Func, Z, Regrt, Se, Wreg, Aluqb, Aluc, Wmem, Pcsrc, Reg2reg);

    input [5:0] Op, Func;
    input Z;
    output Regrt, Se, Wreg, Aluqb, Wmem, Reg2reg;
    output [1:0] Pcsrc, Aluc;

    wire R_type = ~|Op;

    wire   I_add    = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & ~Func[1] & ~Func[0];
    wire   I_sub    = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] &  Func[1] & ~Func[0];
    wire   I_and    = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2]  & ~Func[1] & ~Func[0];
    wire   I_or     = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2]  & ~Func[1] &  Func[0];

    wire   I_addi   = ~Op[5] & ~Op[4] &  Op[3] & ~Op[2] & ~Op[1] & ~Op[0];
    wire   I_andi   = ~Op[5] & ~Op[4] &  Op[3] &  Op[2] & ~Op[1] & ~Op[0];
    wire   I_ori    = ~Op[5] & ~Op[4] &  Op[3] &  Op[2] & ~Op[1] &  Op[0];
    wire   I_lw     =  Op[5] & ~Op[4] & ~Op[3] & ~Op[2] &  Op[1] &  Op[0];
    wire   I_sw     =  Op[5] & ~Op[4] &  Op[3] & ~Op[2] &  Op[1] &  Op[0];
    wire   I_beq    = ~Op[5] & ~Op[4] & ~Op[3] &  Op[2] & ~Op[1] & ~Op[0];
    wire   I_bne    = ~Op[5] & ~Op[4] & ~Op[3] &  Op[2] & ~Op[1] &  Op[0];
    wire   I_j      = ~Op[5] & ~Op[4] & ~Op[3] & ~Op[2] &  Op[1] & ~Op[0];

    assign Regrt    = I_addi  | I_andi   | I_ori  | I_lw  | I_sw   | I_beq  | I_bne | I_j  ;
    assign Se       = I_addi  | I_sw     | I_lw   | I_beq | I_bne  ;
    assign Wreg     = I_add   | I_sub    | I_and  | I_or  | I_addi | I_andi | I_ori | I_lw ;
    assign Aluqb    = I_add   | I_sub    | I_and  | I_or  | I_beq  | I_bne  | I_j   ;
    assign Aluc[1]  = I_and   | I_or     | I_andi | I_ori;
    assign Aluc[0]  = I_sub   | I_or     | I_ori  | I_beq | I_bne  ;
    assign Wmem     = I_sw;
    assign Pcsrc[1] = I_beq&Z | I_bne&~Z | I_j    ;
    assign Pcsrc[0] = I_j;
    assign Reg2reg  = I_add   | I_sub    | I_and  | I_or  | I_addi | I_andi | I_ori | I_sw | I_beq | I_bne | I_j;

endmodule
