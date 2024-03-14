#include <xc.inc>  
      
GLOBAL _lcm
      
PSECT mytext, local, class=CODE, reloc=2  

    CLRF 0x31

_lcm:
    MOVFF 0x01,0x10
    MOVFF 0x03,0x11
    MOVF 0x11,W
    
    Euclidean_div:
	;BNZ 0x10 
	MOVF 0x10,W
	CPFSGT 0x11
	   GOTO sub10_11
	GOTO sub11_10
	;BNZ 0x10
	;RETURN
	
    sub11_10:		;0x11>0x10
	MOVF 0x10,W
	SUBWF 0x11,W
	MOVWF 0x11
	
	CPFSEQ 0x00
	    GOTO Euclidean_div
	MOVFF 0x11,0x00
	GOTO _gcd
    sub10_11:		;0x11<=0x10
	MOVF 0x11,W
	SUBWF 0x10,W
	MOVWF 0x10
	
	CPFSEQ 0x00
	    GOTO Euclidean_div
	MOVFF 0x10,0x00
	GOTO _gcd
    _gcd:	    ;get gcd
	MOVF 0x10,W
	ADDWF 0x11,W
	MOVWF 0x00
    div:
	INCF 0x30
        MOVF 0x00,W
        SUBWF 0x01
	
	MOVF 0x31,W
	CPFSEQ 0x01
	    GOTO div
    ans:
	MOVF 0x03,W
	MULWF 0x30
	MOVFF PRODH,0x02
	MOVFF PRODL,0x01
	return


