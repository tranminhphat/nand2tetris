// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(RESTART)
  //PUT SCREEN START LOCATION IN RAM0
  @SCREEN
  D=A
  @0
  M=D	

///////////////////////////
(KBDCHECK)
  @KBD
  D=M
  @BLACK
  //JUMP TO BLACK IF ANY KBD KEYS ARE PRESSED
  D;JGT	
	//ELSE JUMP TO WHITE
  @WHITE
  D;JEQ

  // Infinite loop
  @KBDCHECK
  0;JMP

///////////////////////////
(BLACK)
  // STORE IN RAM1 THE COLOR
  @1
  M=-1
  @UPDATESCREEN
  0;JMP

(WHITE)
  // STORE IN RAM1 THE COLOR
  @1
  M=0
  @UPDATESCREEN
  0;JMP

///////////////////////////
(UPDATESCREEN)
  // CHECK IN RAM1 WHAT COLOR TO FILL
  @1
  D = M

  // GET THE SCREEN START LOCATION AND START FILLING
  @0
  A = M
  M = D
  
  @0
  D=M+1	//INC TO NEXT PIXEL
  @KBD
  D=A-D	//KBD-SCREEN=A

  @0
  M=M+1	//INC TO NEXT PIXEL
  A=M

  //IF A=0 EXIT AS THE WHOLE SCREEN IS BLACK
  @UPDATESCREEN
  D;JGT	

////////////////////////////
  @RESTART
  0;JMP
