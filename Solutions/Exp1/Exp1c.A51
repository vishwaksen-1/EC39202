


				
				ORG 8100H
				; SUBSTRING

				MOV DPTR , #9000H
				MOV A, #42H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #41H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #4CH
				MOVX @DPTR , A
				INC DPTR
				MOV A, #4CH
				MOVX @DPTR , A
				INC DPTR
				MOV A, #0
				MOVX @DPTR , A
				
				
				;SUPER STRING
				
				MOV DPTR , #9200H
				
				MOV A, #47H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #55H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #44H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #54H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #48H
				MOVX @DPTR , A
				INC DPTR
				
				MOV A, #45H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #42H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #41H
				MOVX @DPTR , A
				INC DPTR
				MOV A, #4CH
				MOVX @DPTR , A
				INC DPTR
				MOV A, #4CH
				MOVX @DPTR , A
				INC DPTR
				MOV A, #0
				MOVX @DPTR , A
				
				
				; STRING MATHING				
				; YEAH BOII
				
				MOV R3,#0 ; CTR for Long String -> "i"
                MOV R4,#0 ; CTR for Substring -> "j"
                       
                       
SUBSTR_SEARCH: ; bruteforce
                        MOV A,R4
                        ADD A,R3
                        MOV R7,A ; R7=R4+R3
                        MOV DPTR,#9200H
                        MOV A,DPL

                        ADD A,R7
                        MOV DPL,A
                        MOVX A,@DPTR
                        MOV B,A ; Storing "i"th element of long string in B
                       
                        MOV DPTR,#9000H
                        MOV A,DPL
                        ADD A,R4
                        MOV DPL,A
                        MOVX A,@DPTR
                        MOV R5,A ; Storing "j"th element of substring in A
                       
                        MOV A,R5
                       
                        ; Comparison
                        CJNE A,B, NOT_EQUAL ; Not Equal
                       
                        ; Now equal
                        CJNE A,#0,EQUAL ; Checking EOS
                       
                        ; Found EOS Char '\0'
                        ; Substring Found, store the index and PROGEND
                        MOV DPTR,#9500H
                        MOV A,R3
                        MOVX @DPTR,A
                        SJMP HITLER
                       
EQUAL:
                        INC R4
                        SJMP SUBSTR_SEARCH

NOT_EQUAL:
                        ; Check if we have reached the end of the longer string
                        MOV A,B
                        CJNE A,#0,CONTINUE ; Substring is possible
                       
                        ; Reached EOS in longer string
                        ; Substring is not possible, Store -1 at 9500H and PROGEND
                        MOV DPTR, #9500H
                        MOV A, #-1 ; Storing -1
                        MOVX @DPTR, A
                        SJMP HITLER

CONTINUE:
                        ; Not reached EOS in longer string
                        ; Checking EOS for substring
                        MOV A, R5
                        CJNE A, #0, CTR_RST
                       
                        ; Substring Found
                        MOV DPTR, #9500H
                        MOV A,R3
                        MOVX @DPTR, A
                        SJMP HITLER

				CTR_RST:
                        MOV R4,#0 ; Reset
                        INC R3
                        SJMP SUBSTR_SEARCH

			
				HERE:
					SJMP HERE

				END