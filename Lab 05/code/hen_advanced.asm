#include <xc.inc>  
      
GLOBAL _multi_signed  
      
PSECT mytext, local, class=CODE, reloc=2  
 
_multi_signed:  
    MOVFF 0x01, 0x21  
    XORWF 0x21 ;to save + or - 
      
    BTFSC WREG, 7  
	NEGF WREG  
    BTFSC 0x01, 7  
	NEGF 0x01  
    ;convert to +
_loop:   
    CLRF STATUS 
    ADDWF 0x11 ;+=answer 
      
    BTFSC STATUS, 0  ;if carry>0,[0x10]++ ??
	INCF 0x10  
   
    DECF 0x01  
    BNZ 0x01 
endpoint: 
    MOVFF 0x10, 0x02 
    MOVFF 0x11, 0x01 
    BTFSS 0x21, 7 ;if is + ,return 
	RETURN     
	
    ;MOVLW 0xFF    ;xor 11111111
    
    ;if is - ,get 2'scomplement ,return  
    COMF 0x02
    COMF 0x01
    INCF 0x01
    
    CLRF STATUS 
    BTFSC STATUS, 0 ;if carry>0,[0x02]++ 
	INCF 0x02 
    RETURN


