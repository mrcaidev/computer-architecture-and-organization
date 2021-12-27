`timescale 1ns / 1ps

// Select 1 in 2. (5-bits)
module MUX2X5 (A0, A1, S, Y);

    input [4:0] A0, A1;
    input S;
    output [4:0] Y;

    function [4:0] select;

        input [4:0] A0, A1;
        input S;

        case(S)
            1'b0: select = A0;
            1'b1: select = A1;
        endcase

    endfunction

    assign Y = select(A0, A1, S);

endmodule