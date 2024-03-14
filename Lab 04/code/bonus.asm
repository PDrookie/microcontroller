List p=18f4520
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x000
	
	n EQU 0x08
	k EQU 0x04
 
	MOV macro l, f
	    MOVLW l
	    MOVWF f
	    endm	    
	        
	Initial:  
	    MOV n, 0x001
	    MOV k, 0x002
	    TSTFSZ 0x001
		GOTO Main
	    GOTO finish
	    
	Main:
	    RCALL Fact
	    GOTO finish   

	Fact:    
	    TSTFSZ 0x002
		GOTO NZZ
	    INCF 0x000
	    RETURN 	    
	    NZZ:
		MOVF 0x001, w
		CPFSLT 0x002
		    GOTO equal
		GOTO Nequal
	    equal:
		INCF 0x000
		RETURN
	    Nequal: ;C(n, k) = C(n - 1, k) + C(n - 1, k - 1)
		DECF 0x001
		DECF 0x002
		RCALL Fact
		INCF 0x001
		INCF 0x002
		DECF 0x001
		RCALL Fact
		INCF 0x001
		RETURN		
	finish:
	    NOP
end
