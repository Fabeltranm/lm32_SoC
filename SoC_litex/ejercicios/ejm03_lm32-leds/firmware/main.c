#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

static void wait(unsigned int ds)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/10*ds);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}




int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();
  char dat1=32;
	puts("\niniciando ejemplo 03 leds con lm32 "__DATE__" "__TIME__"\n ");
	uint8_t i, j;
	for (i=0;i<10;i++)
	puts(dat1++);

	leds_out_write(0xfff);
	wait(10);
	leds_out_write(0x000);
	wait(10);
	leds_out_write(0xfff);
	wait(10);
	while(1) {

		for (j=0; j < 2;j++){
			for (i=0; i < 9;i++){
				if (j==1)
					leds_out_write((2<<i));
				else
					leds_out_write(0x100>>i);

			wait(3);
			}
		}
	}
	return 0;
}
