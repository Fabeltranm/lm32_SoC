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

void config_timerIRQ(unsigned int ms)
{
	uint32_t t;

	timer0_en_write(0);
	t = (SYSTEM_CLOCK_FREQUENCY/1000)*ms;
	timer0_reload_write(t);
	timer0_load_write(t);
	timer0_en_write(1);

	timer0_ev_pending_write(1);
	timer0_ev_enable_write(1);
  irq_setmask(irq_getmask() | (1 << TIMER0_INTERRUPT));

}


int main(void)
{
	irq_setmask(0);
	irq_setie(1);

	uart_init();
	config_timerIRQ(500);

	puts("\nExample 06  lm32-CONFIG interrupciones "__DATE__" "__TIME__"\n");
  printf("get mask %d",irq_getmask());


	while(1);
	return 0;
}
