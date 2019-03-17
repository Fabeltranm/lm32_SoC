#include <generated/csr.h>
#include <irq.h>
#include <uart.h>
#include "variables.h"

extern void periodic_isr(void);
void timer02_isr(void);
void isr(void);


void isr(void)
{
	unsigned int irqs;

	irqs = irq_pending() & irq_getmask();

	if(irqs & (1 << UART_INTERRUPT))
		uart_isr();
	if(irqs & (1 << TIMER0_INTERRUPT))
		timer02_isr();

}



void timer02_isr(void){

	// borrador por soft la interrupción del periferico
  timer0_ev_pending_write (1);
	led_out_write(~led_out_read());
  dir_global= ~dir_global;
	timer0_ev_enable_write(1);

}
