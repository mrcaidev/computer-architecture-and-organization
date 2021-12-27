`timescale 1ns / 1ps

// Data memory.
module DATAMEM(Addr, Din, Clk, We, Dout);
    input [31:0] Addr,Din;
    input Clk, We;
    output [31:0]Dout;

    reg [31:0] Ram[0:31];
    assign Dout = Ram[Addr[6:2]];

    always @ (posedge Clk) begin
        if (We)
            Ram[Addr[6:2]] <= Din;
    end

    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            Ram[i] = 0;
    end

endmodule
