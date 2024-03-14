List p=18f4520
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x00
	
	
	initial:
	    MOVLW 0x20
	    MOVWF 0x002
	    MOVLW b'11101010'
	    MOVWF 0x000	    
	loop:
	    BTFSC 0x000, 0
		DECF 0x002
	    BTFSS 0x000, 0
		INCF 0x002 
	    RRNCF 0x000
	    CPFSEQ 0x000
	    GOTO loop
	    NOP
	    
	end






