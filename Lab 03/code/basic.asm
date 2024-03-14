List p=18f4520
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x000
	
    MOVLW b'11110000'
    MOVWF TRISA
    RRNCF TRISA    
    BTFSC TRISA, 6 
	BSF TRISA, 7
    RRCF TRISA  
       
    end


