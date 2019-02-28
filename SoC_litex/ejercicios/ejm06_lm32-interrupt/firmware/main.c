#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>


static void wait_ms(unsigned int ms)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/1000*ms);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}

static void init_timerIRQ(unsigned int ms)
{
	uint8_t t;

	timer0_en_write(0);
	t = ms*SYSTEM_CLOCK_FREQUENCY/1000;
	timer0_reload_write(t);
	timer0_load_write(t);
	timer0_en_write(1);

}


int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();
  init_timerIRQ(1000);


	puts("\nExample 06  lm32-CONFIG interrupciones "__DATE__" "__TIME__"\n");

//	irq_setmask(TIMER0_INTERRUPT);
//	uint32_t mask &= ~(1 << TIMER0_INTERRUPT);
//  irq_setmask(mask)

  timer0_ev_enable_write(1);
	while(1);

	return 0;
}
