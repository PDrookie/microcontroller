#include"xc.inc"
GLOBAL _lcm
    
PSECT mytext, local, class=CODE, reloc=2
 
    _lcm:
	MOVFF 0x001, LATD
	MOVFF 0x003, LATC ; ??FR
	_gcd:
	    MOVFF 0x003, WREG ; ?b
	    CPFSLT 0x001 ; a ? b
		GOTO aBig
	    MOVFF 0x001, WREG
	    GOTO bBig
	    ;a > b, a -= b
	    ;a < b, b -= a
	    ;a == b end
	    
	    aBig:
		SUBWF 0x001, 0 ; a - b
		MOVWF 0x001 ; a = a - b
		CPFSEQ 0x003
		    GOTO _gcd
		;MOVFF 0x003, WREG
		GOTO _before_loop
		
	    bBig:
		SUBWF 0x003, 0 ; b - a
		MOVWF 0x003 ; b = b - a
		CPFSEQ 0x001
		    GOTO _gcd
		;MOVFF 0x001, WREG
		GOTO _before_loop
	
	_before_loop:
	    CLRF 0x001
	    ;MOVFF LATD, 0x005
	    ;MOVFF LATC, WREG
	    ;MULWF 0x005
	    ;MOVFF PRODH, 0x004
	    ;MOVFF PRODL, 0x005
	    MOVFF LATC, 0x005
	    MOVLW 0x002
	    CPFSGT 0x003
		GOTO finish_1
	    _loop:
		MOVFF 0x003, WREG
		SUBWF 0x005, 1
		BTFSC 0x005, 7
		   GOTO keep
		INCF 0x001
		BC carry 
		    GOTO _loop
		   
		keep:
		    TSTFSZ 0x004
			GOTO plus
		    ADDWF 0x005, 1	
		    GOTO finish	
		    
		plus:
		    ADDWF 0x005, 1
		    DECF 0x004
		    MOVLW 0xFD
		    ADDWF 0x005, 1
		    MOVFF 0x003, WREG
		    SUBWF 0x005, 1
		    INCF 0x001
		    SUBWF 0x005, 1
		    INCF 0x001
		    SUBWF 0x005, 1
		    INCF 0x001
		    INCF 0x005
		    INCF 0x005
		    INCF 0x005
		    GOTO _loop_2
		    
		_loop_2:
		    SUBWF 0x005, 1
		    INCF 0x001
		    BTFSS 0x005, 7
		       GOTO _loop
		    BC carry 
			GOTO _loop_2
		    
		    
		carry:
		    INCF 0x000
		    BCF STATUS, 0
		    GOTO _loop
		    
			
		
	    NOP
	;??div, ?????
	finish_1:
	    MOVFF 0x004, 0x000
	    MOVFF 0x005, 0x001
	
	finish:
	    MOVFF 0x001, WREG
	    MOVFF LATD, 0x001
	    MULWF 0x001
	    MOVFF PRODL,0x001
	    MOVFF PRODH, 0x000
	    NOP
	RETURN