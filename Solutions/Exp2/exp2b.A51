	ORG 8100H
	MOV P1 , #00H
	
	CLIP:
		MOV P1, #0000H ; OFF
		SETB P1.0 ; RED
		ACALL DELAY
		
		MOV P1, #0000H ; OFF
		SETB P1.1 ; ORANGE
		ACALL DELAY
		
		MOV P1, #0000H ; OFF
		SETB P1.2 ; BLUE
		ACALL DELAY

		MOV P1, #0000H ; OFF
		SETB P1.3 ; GREEN
		ACALL DELAY
		
		SJMP CLIP

	DELAY: ;(can use the timer as well)
	
	; dummy DELAY (not using a timer), change the numbers to change the delay
		MOV R1, #128
		D1:
			MOV R2, #128
			D2: 
				MOV R3, #80
				D3:
					DJNZ R3, D3
				DJNZ R2, D2
			DJNZ R1, D1
	
	END
	
	
				
		;SETB P1.4 ; YELLOW
		;ACALL DELAY
		;CLR P1.4
		
		;SETB P1.3 ; GREEN
		;ACALL DELAY
		;CLR P1.3
		
		;SETB P1.2 ; BLUE
		;ACALL DELAY
		;CLR P1.2
		
		