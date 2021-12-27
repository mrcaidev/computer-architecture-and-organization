`timescale 1ns / 1ps

module CPU (Clk, Clrn, pc, Inst, Qa, Qb, R, nextpc, D);

    input Clk, Clrn;
    output [31:0] Inst, nextpc, R, Qb, Qa, pc, D;

    wire [31:0] pc_add_4, immediate, Y, Dout, B_Addr, J_Addr;
    wire Z, Regrt, Se, Wreg, Aluqb, Reg2reg, Wmem;
    wire [1:0] Aluc, Pcsrc;
    wire [4:0] Wr;

    // IF.
    PC program_counter(Clk, Clrn, nextpc, pc);
    PC_INC pc_increment(pc, pc_add_4);
    INSTMEM fetch_instruction(pc, Inst);

    // ID.
    CONUNIT control_unit(Inst[31:26], Inst[5:0], Z, Regrt, Se, Wreg, Aluqb, Aluc, Wmem, Pcsrc, Reg2reg);
    MUX2X5 select_rt_rd(Inst[15:11], Inst[20:16], Regrt, Wr);
    EXT16T32 extend_immediate(Inst[15:0], Se, immediate);
    REGFILE register_file(Inst[25:21], Inst[20:16], D, Wr, Wreg, Clk, Clrn, Qa, Qb);

    // EX.
    MUX2X32 select_Qb_immediate(immediate, Qb, Aluqb, Y);
    ALU alu(Qa, Y, Aluc, R, Z);

    // MEM.
    DATAMEM store_data(R, Qb, Clk, Wmem, Dout);

    // WB.
    MUX2X32 select_R_Dout(Dout, R, Reg2reg, D);

    // Get next PC.
    B_ADDR get_B_addr(pc_add_4, immediate, B_Addr);
    J_ADDR get_J_addr(pc_add_4, Inst[25:0], J_Addr);
    MUX4X32 PC_which(pc_add_4, 1'b0, B_Addr, J_Addr, Pcsrc, nextpc);

endmodule
