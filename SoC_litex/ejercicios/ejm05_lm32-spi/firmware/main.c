#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

#include "lcd_spi.h"

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

	puts("\niniciando ejemplo lcd_spi con lm32 "__DATE__" "__TIME__"\n");

  spi_init();
	while(1) {
		lcd_reset();
		lcd_clear(LCD_RED);
		wait(1);
		lcd_clear(LCD_GREEN);
		wait(1);
		lcd_clear(LCD_BLUE);
		wait(1);
		lcd_clear(LCD_YELLOW);
		wait(1);
		write_cmd(0x28);

	}
	return 0;
}
