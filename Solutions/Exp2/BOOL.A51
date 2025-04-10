		
		
		; additional file to be run before running 2c
		
		
		; storing some boolean logic in the addresses 9000H to 900FH

			
		ORG 8100H
		MOV DPTR, #9000H
		MOV R0, #00H
		
		LOOP:
			MOV A, R0
			ANL A, #0BH
			CJNE A, #0AH, ZERO
			MOV A, #0FFH
			SJMP STORE
		
		ZERO:
			MOV A, #00H
		
		STORE:
			MOVX @DPTR, A
			INC DPTR
			INC R0
			CJNE R0, #10H, LOOP
		
		HERE:
			SJMP HERE
		
		END