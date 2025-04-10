        ; A simple code using timer overflow to blink LED for half a second 


        ORG 8100H

        MOV TMOD, #80H 
        MOV TH0, #00H
        MOV TL0, #00H
        SETB TR0

        LIGHT:
            SETB P1.0
            ACALL DELAY
            CLR P1.0
            ACALL DELAY
            SJMP LIGHT

        DELAY:
            MOV R1, #7 ; (FOR APPROX 0.5 SEC DELAY)
            WAIT:
                JNB TF0, WAIT_R
                CLEAR:
                    CLR TR0
                    MOV TH0, #00H
                    MOV TL0, #00H
                    CLR TF0
                    SETB TR0
                    DJNZ R1, WAIT
                    RET
                WAIT_R:
                    SJMP WAIT
        END