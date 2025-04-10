ORG 8100H
			MOV A, #0F9H
			MOV DPTR, #9090H
			MOVX @DPTR, A
			
			MOV A, #90H
			MOV DPTR, #0E803H
			MOVX @DPTR, A
			
			READ:
				MOV DPTR, #0E800H
				MOVX A, @DPTR
				MOV DPTR, #9070H
				MOVX @DPTR, A
				
				COMP:
					MOV DPTR, #9090H
					MOVX A, @DPTR
					MOV B, A
					
					MOV DPTR, #9070H
					MOVX A, @DPTR
					
					SUBB A, B
					
					JNC LON
					SJMP LOFF
			
			LON:
				MOV A, #01H
				MOV DPTR, #0E801H
				MOVX @DPTR, A
				
				SJMP READ
				
			LOFF:
				MOV A, #00H
				MOV DPTR, #0E801H
				MOVX @DPTR, A
				
				SJMP READ
end