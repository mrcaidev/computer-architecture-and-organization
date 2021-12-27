`timescale 1ns / 1ps

// Program counter.
module PC (Clk, Clrn, nextpc, pc);

    input Clk, Clrn;
    input  [31:0] nextpc;
    output reg [31:0] pc;

    always @ (posedge Clk or negedge Clrn) begin
        if (Clrn == 0)
            pc <= 0;
        else
            pc <= nextpc;
    end

endmodule
