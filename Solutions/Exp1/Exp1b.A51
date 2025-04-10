		ORG 8100H
		MOV DPTR, #9500H

		; CONSIDERING THE POLYNOMIAL TO BE X^3 + 6*X^2 + 11*X +6
		;; TAKING THE VALUE N = 3, X = 2
		
		MOV A, #3
		MOVX @DPTR , A
		INC DPTR
		MOV A, #2
		MOVX @DPTR , A

		; STORING VALUES OF A_i IN THE SUBSEQUENT ADDRESSES
		INC DPTR
		MOV A, #1
		MOVX @DPTR , A
		INC DPTR
		MOV A, #6
		MOVX @DPTR , A
		INC DPTR
		MOV A, #11
		MOVX @DPTR , A
		INC DPTR
		MOV A, #6
		MOVX @DPTR , A
		
		MOV DPTR, #9500H
		;MOVX R2, @DPTR
		MOVX A, @DPTR
		MOV R2, A
		MOV R0, #0
		INC DPTR
		;MOVX R1, @DPTR
		MOVX A, @DPTR
		MOV R1, A
		INC DPTR
		
		
		FUN:
					MOVX A, @DPTR
					MOV B, A
					MOV A , R0
					ADD A , B
					MOV B , A 
					MOV A , R1
					MUL AB
					
					MOV R0 , A
					INC DPTR
					DJNZ R2 , FUN
		
		MOV DPTR , #9550H
		MOV A, R0
		ADD A , #6
		MOVX @DPTR , A	

		HERE:
					SJMP HERE

		END
		 
