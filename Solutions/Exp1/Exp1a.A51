


		ORG 8100H

		MOV DPTR,#9000H;
		MOV R1,#100;
		MOV R3, #50;

		; save values in pseudo-random order at 9000H - 9064H
		loop: 
				MOV A,R1;
				XRL A, R3;
				MOVX @DPTR, A;
				INC DPTR;
				DJNZ R1,loop;
				
				MOV R0 , #99
				CLR A
				

		; Bubble sort		
		bubble: 
				MOV DPTR , #9000H
				MOV A , R0
				MOV R1 , A
				
				inner: 
						MOVX A, @DPTR
						MOV B, A
						INC DPTR
						MOVX A, @DPTR
						CLR C
						MOV R2 , A 
						SUBB A, B
						JNC NOSWAP
						MOV A, B          ; SWAPPING START
						MOVX @DPTR, A
						DEC DPL
						MOV A, R2
						MOVX @DPTR, A
						INC DPTR          ; SWAPPING END
					
				NOSWAP:
						DJNZ R1 , inner    
			DJNZ R0 , bubble


		; Binary search
		MOV DPTR, #9500H;
		MOVX A, @DPTR;
		MOV R7, #55; ;R7 stores the value to be searched
		MOV A, R7
		MOVX @DPTR, A

		MOV DPTR, #9000H;
		MOV R1, #0;
		MOV R2, #99;

		bloop: 
				MOV A, R1;
				ADD A, R2;
				MOV B, #2;
				DIV AB;
				MOV R3, A;
				ADD A, DPL;
				MOV DPL,A;
				MOVX A, @DPTR;
				MOV B, R7;
				CJNE A,B,func;
				MOV DPTR,#9550H;
				MOV A, R3;
				MOVX @DPTR, A;
				LJMP endd; 

		func: 
				JC func1;
				JNC func2;

		func1:
				MOV A, R3;
				ADD A, #1;
				MOV R1, A;
				LJMP repeat;
		func2:
				MOV A, R3;
				SUBB A, #1;
				MOV R2, A;
				LJMP repeat;

		repeat:

				MOV A, R1;
				MOV B, R2;
				CJNE A, B, check;
				LJMP intial;

		check: 
				JC intial;
				MOV A, #0;
				SUBB A, #1;
				MOV DPTR, #9550H;
				MOVX @DPTR, A;
				LJMP endd;

		intial:
				MOV DPTR, #9000H;
				LJMP bloop;

		HERE:
				SJMP HERE

END