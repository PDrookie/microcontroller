List p=18f4520
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x000

	MOV macro literal, f
	    MOVLW literal
	    MOVWF f
	    endm

	ADD macro f1, f2
	    ADDWF f1, w
	    MOVFF WREG, f2
	    endm

	MUL macro f1, f2, f3
	    step1:
		MOVF  0x001, WREG
		MULWF f1
	    step2:
		MOVF f3, WREG
		BTFSC f2, 7
		    SUBWF PRODH
	   step3:
		MOVF f2, WREG
		BTFSC f3, 7
		    SUBWF PRODH
	    step4:
		MOVFF PRODH, 0x010
		MOVFF PRODL, 0x011
	    endm

	OverFlow macro f
	    BNC Do
		INCF f
	    Do:
		NOP
	    endm

	Add_Mul macro xh, xl, yh, yl
	    MOV xh, 0x020
	    MOV yh, 0x022
	    ADD 0x020, 0x000
	    MOV xl, 0x021
	    MOV yl, 0x023
	    ADD 0x021, 0x001
	    OverFlow 0x000
	    MUL 0x000, 0x000, 0x001
	    endm

	Main:
	    ;Add_Mul 0x04, 0x02, 0x0A, 0x04
	    Add_Mul 0xFF, 0xEB, 0x00, 0x0F

	end



