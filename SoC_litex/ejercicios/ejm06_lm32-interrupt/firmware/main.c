#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>




static void init_timerIRQ(unsigned int ms)
{
	uint8_t t;

	timer0_en_write(0);
	t = ms*SYSTEM_CLOCK_FREQUENCY/1000;
	timer0_reload_write(t);
	timer0_load_write(t);
	timer0_en_write(1);
  timer0_ev_enable_write(1);
}


int main(void)
{
	init_timerIRQ(1000);
	irq_setmask(2);
	irq_setie(1);

	uart_init();

	puts("\nexample 06  lm32-CONFIG interrupciones"__DATE__" "__TIME__"\n");


	while(1) ;

	return 0;
}
