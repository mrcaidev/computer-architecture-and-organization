`timescale 1ns / 1ps

// Instruction memory.
module INSTMEM (Addr, Inst);

    input [31:0] Addr;
    output [31:0] Inst;

    wire [31:0] Rom [0:255];

    // Initialize r1, r2.
	assign Rom[8'h00] = 32'h20010054; // addi r1  , r0 , 54h (alu_result = 32'h00000054)
	assign Rom[8'h01] = 32'h20020033; // addi r2  , r0 , 33h (alu_result = 32'h00000033)

	// R-instructions.
    assign Rom[8'h02] = 32'h00221820; // add  r3  , r1 , r2  (alu_result = 32'h00000087)
	assign Rom[8'h03] = 32'h00222022; // sub  r4  , r1 , r2  (alu_result = 32'h00000021)
 	assign Rom[8'h04] = 32'h00222824; // and  r5  , r1 , r2  (alu_result = 32'h00000010)
    assign Rom[8'h05] = 32'h00223025; // or   r6  , r1 , r2  (alu_result = 32'h00000077)

    // I-instructions.
	assign Rom[8'h06] = 32'h20280026; // addi r8  , r1 , 26h (alu_result = 32'h0000007a)
	assign Rom[8'h07] = 32'h30290026; // andi r9  , r1 , 26h (alu_result = 32'h00000004)
	assign Rom[8'h08] = 32'h342a0026; // ori  r10 , r1 , 26h (alu_result = 32'h00000076)

	assign Rom[8'h09] = 32'h8c0c0004; // lw   r12 , r0(4)    (alu_result = 32'h00000004)
	assign Rom[8'h0A] = 32'hac0c0008; // sw   r12 , r0(8)    (alu_result = 32'h00000008)

	assign Rom[8'h0B] = 32'h10220014; // beq  r1  , r2 , 14h (alu_result = 32'h00000021)
	assign Rom[8'h0C] = 32'h14220004; // bne  r1  , r2 , 4   (alu_result = 32'h00000021)

	assign Rom[8'h0D] = 32'h3c0effff; // lui  r14 , FFFFH    (Skipped)
	assign Rom[8'h0E] = 32'h3c0effff; // lui  r14 , FFFFH    (Skipped)
	assign Rom[8'h0F] = 32'h3c0effff; // lui  r14 , FFFFH    (Skipped)
	assign Rom[8'h10] = 32'h3c0effff; // lui  r14 , FFFFH    (Skipped)

	// J-instructions.
	assign Rom[8'h11] = 32'h08000000; // j    0h
	assign Rom[8'h12] = 32'h20280026; // addi r8  , r1 , 26h (Skipped)
	assign Rom[8'h13] = 32'h20280026; // addi r8  , r1 , 26h (Skipped)
	assign Rom[8'h14] = 32'h20280026; // addi r8  , r1 , 26h (Skipped)

    // Output instruction at specified address.
    assign Inst = Rom[Addr[9:2]];

endmodule
