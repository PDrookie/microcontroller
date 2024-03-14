#include "setting_hardaware/setting.h"
#include <stdlib.h>
#include "stdio.h"
#include "string.h"
// using namespace std;

#define _XTAL_FREQ 1000000

char str[20];
int lightbulb = 0;
void Mode1(){   // Todo : Mode1 
    return ;
}
void Mode2(){   // Todo : Mode2 
    return ;
}
void main(void) 
{
    SYSTEM_Initialize() ;
    TRISA = 0x00;
    LATA = 0x00;
    TRISBbits.RB0 = 1;
    RCONbits.IPEN = 0;
    INTCONbits.INT0IF = 0;
    INTCONbits.INT0IE = 1;
    INTCONbits.GIE = 1;
    UART_Write('0');
    UART_Write(' ');
    while(1);
    return;
}

void __interrupt(high_priority) Hi_ISR(void)
{
    if(INTCONbits.INT0IF == 1){
        lightbulb ++;
        lightbulb %= 16;
        __delay_ms(500);
        LATA = lightbulb;
        switch(lightbulb){
            case 0:
                UART_Write('0');
                UART_Write(' ');
                break;
            case 1:
                UART_Write('1');
                UART_Write(' ');
                break;
            case 2:
                UART_Write('2');
                UART_Write(' ');
                break;
            case 3:
                UART_Write('3');
                UART_Write(' ');
                break;
            case 4:
                UART_Write('4');
                UART_Write(' ');
                break;
            case 5:
                UART_Write('5');
                UART_Write(' ');
                break;
            case 6:
                UART_Write('6');
                UART_Write(' ');
                break;
            case 7:
                UART_Write('7');
                UART_Write(' ');
                break;
            case 8:
                UART_Write('8');
                UART_Write(' ');
                break;
            case 9:
                UART_Write('9');
                UART_Write(' ');
                break;
            case 10:
                UART_Write('1');
                UART_Write('0');
                UART_Write(' ');
                break;
            case 11:
                UART_Write('1');
                UART_Write('1');
                UART_Write(' ');
                break;
            case 12:
                UART_Write('1');
                UART_Write('2');
                UART_Write(' ');
                break;
            case 13:
                UART_Write('1');
                UART_Write('3');
                UART_Write(' ');
                break;
            case 14:
                UART_Write('1');
                UART_Write('4');
                UART_Write(' ');
                break;
            case 15:
                UART_Write('1');
                UART_Write('5');
                UART_Write(' ');
                break;
        }
        ClearBuffer();
        INTCONbits.INT0IF = 0;
    }
    return;

}