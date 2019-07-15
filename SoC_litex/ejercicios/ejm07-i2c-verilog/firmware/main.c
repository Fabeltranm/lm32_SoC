#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>


#include "i2c.h"

static void wait(unsigned int ds)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY*ds);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}


int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();

	puts("\niniciando ejemplo i2c con lm32 "__DATE__" "__TIME__"\n");

   i2c_init();
	while(1) {
		i2c_write(0x30,0xAA);
		wait(5);
	}
	return 0;
}
