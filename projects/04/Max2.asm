// if (R1 - R2 >= 0) goto POS
//   R0 = R1
//   goto END
// POS:
//   R0 = R2
// END:

  @R1
  D=M
  @R2
  D=D-M
  @POS
  D;JLT
  @R1
  D=M
  @R0
  M=D
  @END
  0;JMP
(POS)
  @R2
  D=M
  @R0
  M=D
(END)
  @END
  0;JMP
