#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <generated/csr.h>
#include <irq.h>
#include <uart.h>

extern void periodic_isr(void);

void timer0_isr(void);
void isr(void);

void isr(void)
{
	unsigned int irqs;
	 irq_pending() & irq_getmask();

	if(irqs & (1 << UART_INTERRUPT))
		uart_isr();
	if(irqs & (1 << TIMER0_INTERRUPT))
		timer0_isr();

}



void timer0_isr(void){

	// borrador por soft la interrupción del periferico
  timer0_ev_pending_write (1);
	printf("\ntimer interrupciones \n");
  timer0_ev_enable_write(1);
}
