List p=18f4520
    #include<p18f4520.inc>
        CONFIG OSC = INTIO67
        CONFIG WDT = OFF
        org 0x000

    MOVLW 0x76
    MOVWF 0x000
    MOVLW 0x44
    MOVWF 0x010
    ADDWF 0x000, w
    MOVWF 0x020
    MOVLW 0x12
    MOVWF 0x001
    MOVLW 0x93
    MOVWF 0x011
    ADDWF 0x001, w
    MOVWF 0x021
    BNC over
	INCF 0x020
    over:
	NOP
end

