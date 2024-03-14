#include <xc.h>

extern unsigned int lcm(unsigned int a, unsigned int b);

void main(void) {
    /* Replace with your application code */
    volatile unsigned int ans = lcm(140, 40);
    while (1);
    return;
}