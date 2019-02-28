
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <generated/csr.h>
#include <irq.h>
#include <uart.h>



extern void periodic_isr(void);

void timer_isr(void);
void isr(void);

void isr(void)
{
	unsigned int irqs;

	irqs = irq_pending() & irq_getmask();

	if(irqs & (1 << TIMER0_INTERRUPT))
	timer_isr();

}


void timer_isr(void){

	// borra la interrupción para que no siga disparando
  timer0_ev_pending_write (1);
	puts("\ntimer interrupciones \n");
  timer0_ev_enable_write(1);
}
