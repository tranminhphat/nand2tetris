// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

//  i = R0
//  ans = 0
// LOOP:
//  if ( i == 0 ) goto STOP
//  ans = ans + R1
//  i = i - 1
//  goto LOOP
// STOP:
//  R2 = ans

// Put your code here.

//  i = R0
//  ans = 0
@R0
D = M
@i
M = D
@ans
M=0
(LOOP)
//  if ( i == 0 ) goto STOP
@i
D = M
@STOP
D;JEQ
//  ans = ans + R1
@ans
D = M
@R1
D=D+M
@ans
M=D
//  i = i - 1
@i
M = M - 1
// goto LOOP
@LOOP
0;JMP
(STOP)
//  R2 = ans
@ans
D = M
@R2
M = D
// infinite loop
(END)
@END
0;JMP


