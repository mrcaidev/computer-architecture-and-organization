`timescale 1ns / 1ps

// Register file.
module REGFILE(Ra, Rb, D, Wr, We, Clk, Clrn, Qa, Qb);

    input [4:0] Ra,Rb;
    input [31:0] D;
    input [4:0] Wr;
    input We, Clk, Clrn;
    output [31:0] Qa, Qb;

    reg [31:0] R[1:31];

    assign Qa = (Ra == 0) ? 0 : R[Ra];
    assign Qb = (Rb == 0) ? 0 : R[Rb];

    integer i;
    always @ (posedge Clk) begin
        if (Clrn == 0)
            for (i = 0; i < 32; i = i + 1)
                R[i] <= 0;
        else if (We == 1 && Wr != 0)
            R[Wr] <= D;
    end

endmodule
