`timescale 1ns / 1ps

module CPU_tb;
reg             Clk, En, Clrn;

wire    [31:0]  IF_ADDR;
wire    [31:0]  EX_R;
wire    [31:0]  EX_X;
wire    [31:0]  EX_Y, IF_Inst, ID_Inst, EX_PC;
wire    [4:0]   E_Rd, M_Rd, Rs, Rt;
wire    [1:0]   Pcsrc;

CPU cpu(.Clk(Clk), .En(En), .Clrn(Clrn), .IF_ADDR(IF_ADDR), .EX_R(EX_R), .EX_X(EX_X), .EX_Y(EX_Y), .E_Rd(E_Rd), .M_Rd(M_Rd), .Rs(Rs), .Rt(Rt), .IF_Inst(IF_Inst), .ID_Inst(ID_Inst), .EX_PC(EX_PC), .Pcsrc(Pcsrc));

initial begin
    Clk=0; Clrn=0; En=1;
    #10;
    Clk=1; Clrn=0;
    #10;
    Clrn=1; Clk=0;
    forever #20 Clk = ~Clk;
end

endmodule
