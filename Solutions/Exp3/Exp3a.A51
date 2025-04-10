


			ORG 8100H
			
			MOV A, #80H
			MOV DPTR, #0E803H
			MOVX @DPTR, A
			
			MOV A, #00H
			MOV DPTR, #0E801H
			MOVX @DPTR, A
			MOV DPTR, #0E800H
			
			
			BACK:
				MOV A, #11111100B
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #01100000B
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #11011010B
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #11110010B
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #66H
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #10110110B
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #10111111B
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #0E0H
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A, #0FFH
				MOVX @DPTR, A
				ACALL DELAY
				
				MOV A,#11110111B
				MOVX @DPTR, A
				ACALL DELAY
				
				SJMP BACK
			
			DELAY:
				MOV R1, #8D
				OUTER:
					MOV R2, #255D
					INNER:
						MOV R3, #255D
						AGAIN:
							DJNZ R3, AGAIN
						DJNZ R2, INNER
					DJNZ R1, OUTER
				RET
				END