#include"xc.inc"
GLOBAL _is_square
    
PSECT mytext, local, class=CODE, reloc=2
 

 _is_square:
    MOVFF 0x001, LATD    
    _loop:
	INCF 0x002
	MOVFF 0x002, WREG
	MULWF 0x002
	MOVFF PRODL, WREG
	BTFSS 0x002, 4
	    GOTO _Right
	GOTO _Wrong
	   
    _Right:
	CPFSEQ 0x001
	    GOTO _loop
	MOVLW 0x01
	RETURN
    _Wrong:
	MOVLW 0xFF
	RETURN


