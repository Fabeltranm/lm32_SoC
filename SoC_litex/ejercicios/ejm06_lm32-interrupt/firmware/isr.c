
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <generated/csr.h>
#include <irq.h>
#include <uart.h>



extern void periodic_isr(void);

#define TIMER_INTERRUPT 1

void timer_isr1(void);
void isr(void);
void isr(void)
{
	unsigned int irqs;

	irqs = irq_pending() & irq_getmask();

	if(irqs & (1 << TIMER_INTERRUPT))
		timer_isr1();

}


void timer_isr1(void){

	puts("\ntimer interrupciones \n");

}
