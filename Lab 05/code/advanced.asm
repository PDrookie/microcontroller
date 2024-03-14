#include"xc.inc"
GLOBAL _multi_signed
    
PSECT mytext, local, class=CODE, reloc=2
 

 _multi_signed:    
    MOVFF WREG, 0x003 ;Multiplicand
    
    
    BTFSC 0x001, 7
	NEGF 0x001
    BTFSC 0x003, 7
	NEGF 0x003
    MOVFF 0x003, WREG	
    DECF 0x001
	
    _loop:
	ADDWF 0x003,1
	BNC Do
	    INCF 0x002
	    Do:
		DECF 0x001
		TSTFSZ 0x001 
		GOTO _loop	
	
    
    COMF 0x002
    NEGF 0x003	
    BNC finish
	INCF 0x002
    finish:
	NOP
    RETURN
    	
	
	


