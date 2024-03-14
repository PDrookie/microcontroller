List p=18f4520
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x000
        
        aMatrix:
            a1 EQU 0x025
            a2 EQU 0x01F
            a3 EQU 0x01D
            a4 EQU 0x030

        bMatrix:
            b1 EQU 0x004
            b2 EQU 0x003
            b3 EQU 0x002
            b4 EQU 0x001
	
	MOV_matrix macro literal1, literal2, literal3, literal4, f1, f2, f3, f4
            MOVLW literal1
            MOVWF f1
            MOVLW literal2
            MOVWF f2
            MOVLW literal3
            MOVWF f3
            MOVLW literal4
            MOVWF f4
	    endm
	
	setup:
            LFSR 0, 0x000
            LFSR 1, 0x020
            LFSR 2, 0x022
            MOV_matrix a1, a2, a3, a4, 0x010, 0x011, 0x012, 0x013
            MOV_matrix b1, b2, b3, b4, 0x020, 0x021, 0x022, 0x023

        MUL macro f1, f2
	    MOVF f1, WREG
	    MULWF POSTINC1, 0
	    MOVFF PRODL, INDF0
	    MOVF f2, WREG
	    MULWF POSTINC2, 0
	    MOVF PRODL, WREG
	    ADDWF POSTINC0

	    MOVF f1, WREG
	    MULWF POSTDEC1, 0
	    MOVFF PRODL, INDF0
	    MOVF f2, WREG
	    MULWF POSTDEC2, 0
	    MOVF PRODL, WREG
	    ADDWF POSTINC0
	    endm
    
        Main:
            RCALL multiply
            GOTO finish
    
        multiply:
            MUL 0x010, 0x011
            MUL 0x012, 0x013
            RETURN

        finish:
            NOP
            end



