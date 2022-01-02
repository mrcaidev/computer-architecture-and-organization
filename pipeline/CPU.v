`timescale 1ns / 1ps

module CPU(Clk, En, Clrn, IF_ADDR, EX_X, EX_Y, EX_R, E_Rd, M_Rd, Rs, Rt, IF_Inst, ID_Inst, EX_PC, Pcsrc);

input           Clk, En, Clrn;
output  [31:0]  IF_ADDR, EX_X, EX_Y, EX_R, IF_Inst, ID_Inst, EX_PC;
output  [4:0]   E_Rd, M_Rd, Rs, Rt;
output  [1:0]   Pcsrc;

wire    [31:0]  IF_Result, IF_Addr, IF_PCadd4, D, ID_Qa, ID_Qb, ID_PCadd4, ID_Inst;
wire    [31:0]  E_R1, E_R2, E_I, E_I_L2, Y, E_R, M_R, M_S, Dout, W_D, W_C, ID_I, Alu_X, E_num, ID_I_L2, ID_PC;
wire    [5:0]   E_Op;
wire    [4:0]   ID_Wr, W_Wr;
wire    [1:0]   Aluc, E_Aluc, FwdA, FwdB, E_FwdA, E_FwdB;
wire            Regrt, Se, Wreg, Aluqb, Reg2reg, Wmem, Z;
wire            E_Wreg, E_Reg2reg, E_Wmem, E_Aluqb, Cout, M_Wreg, M_Reg2reg, M_Wmem, W_Wreg, W_Reg2reg, stall, condep;

// IF.
MUX4X32         select_pc(IF_PCadd4, 0, EX_PC, 0, Pcsrc, IF_Result);
PC              program_counter(IF_Result, Clk, En, Clrn, IF_Addr, stall);
PC_INC          pc_increment(IF_Addr, IF_PCadd4);
INSTMEM         fetch_instruction(IF_Addr, IF_Inst);
REG_IF_ID       reg_IF_ID(IF_PCadd4, IF_Inst, En, Clk, Clrn, ID_PCadd4, ID_Inst, stall, condep);

// ID.
CONUNIT         control_unit(E_Op, ID_Inst[31:26], ID_Inst[5:0], Z, Regrt, Se, Wreg, Aluqb, Aluc, Wmem, Pcsrc, Reg2reg, ID_Inst[25:21], ID_Inst[20:16], E_Rd, M_Rd, E_Wreg, M_Wreg, FwdA, FwdB, E_Reg2reg, stall, condep);
MUX2X5          select_rt_rd(ID_Inst[15:11], ID_Inst[20:16], Regrt, ID_Wr);
EXT16T32        extend_immediate(ID_Inst[15:0], Se, ID_I);
REGFILE         register_file(ID_Inst[25:21], ID_Inst[20:16], D, W_Wr, W_Wreg, Clk, Clrn, ID_Qa, ID_Qb);
SHIFTER_32_L2   shift_immediate_l2(ID_I, ID_I_L2);
CLA_32          get_B_addr(ID_PCadd4, ID_I_L2, 0, ID_PC, Cout);
REG_ID_EX       reg_ID_EX(ID_PC, Wreg, Reg2reg, Wmem, ID_Inst[31:26], Aluc, Aluqb, ID_Qa, ID_Qb, ID_I, ID_Wr, En, Clk, Clrn, E_Wreg, E_Reg2reg, E_Wmem, E_Op, E_Aluc, E_Aluqb, E_R1, E_R2, E_I, E_Rd, FwdA, FwdB, E_FwdA, E_FwdB, stall, EX_PC, condep);

//EX
MUX4X32         select_alu_x(E_R1, D, M_R, 0, E_FwdA, Alu_X);
MUX4X32         select_alu_y_first(E_R2, D, M_R, 0, E_FwdB, E_num);
MUX2X32         select_alu_y_second(E_I, E_num, E_Aluqb, Y);
ALU             alu(Alu_X,Y,E_Aluc,E_R,Z);
REG_EX_MEM      reg_EX_MEM(E_Wreg, E_Reg2reg, E_Wmem, E_R, E_num, E_Rd, En, Clk, Clrn, M_Wreg, M_Reg2reg, M_Wmem, M_R, M_S, M_Rd);

//MEM
DATAMEM         data_mem(M_R, M_S, Clk, M_Wmem, Dout);
REG_MEM_WB      reg_MEM_WB(M_Wreg, M_Reg2reg, M_R, Dout, M_Rd, En, Clk, Clrn, W_Wreg, W_Reg2reg, W_D, W_C, W_Wr);

//WB
MUX2X32         select_R_Dout(W_C,W_D,W_Reg2reg,D);

assign IF_ADDR = IF_Addr;
assign EX_R = E_R;
assign EX_X = Alu_X;
assign EX_Y = Y;
assign Rs = ID_Inst[25:21];
assign Rt = ID_Inst[20:16];

endmodule

