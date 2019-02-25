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



int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();

	puts("\nexample 04  lm32-CONFIG PWM_new timer and uart"__DATE__" "__TIME__"\n");
	uint32_t wi=16000000;
 	uint32_t period=32000000;


	pwm_enable_write(1);
    pwm_period_write(period);
	pwm_width_write(wi);
    uint8_t i=0;
	while(1) {
	    wait_ms(1000);
		printf("prueba %d  \n", i++);
	}

	return 0;
}
