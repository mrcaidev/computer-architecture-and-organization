`timescale 1ns / 1ps

module MUX2X1(Q,D,S,Y);
input Q,D,S;
output Y;
function select;
       input Q,D;
       input S;
         case(S)
            1'b0:select=Q;
            1'b1:select=D;
         endcase
endfunction
assign Y=select(Q,D,S);
endmodule
