#include "lcd_spi.h"
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


void set_pin(uint8_t npin, uint8_t value){
  if (value)
    ctrllcd_out_write(ctrllcd_out_read() | (1<< npin));
	else
    ctrllcd_out_write(ctrllcd_out_read() & (~(1<<npin)));

}


void spi_init(void){

	unsigned config = 0;

  int spi_freq= 4000000;
  int div_write= SYSTEM_CLOCK_FREQUENCY/spi_freq -2;

  config |= 0<<CS_POLARITY | 0<<CLK_POLARITY | 0<<CLK_PHASE;
  config |= 0<<LSB_FIRST | 0<<HALF_DUPLEX;
  config |= div_write<<DIV_READ | div_write<<DIV_WRITE;
  spi_config_write(config);
	spi_xfer_write((1<<XFER_CS) | (8<<XFER_WRITE_LENGTH) );

}

void spi_write(uint8_t dato){

  spi_mosi_data_write(dato<<24);
	spi_start_write(1);
	while(spi_active_read());

}
void write_cmd(uint8_t cmd)
{
  set_pin(LCD_CTRL_DC,0);
  spi_write(cmd);
}

void write_data(uint8_t data)
{
  set_pin(LCD_CTRL_DC,1);
  spi_write(data);
}
void lcd_reset(void)
{
    set_pin(LCD_CTRL_LED,1);
    wait_ms(200);
    set_pin(LCD_CTRL_DC,1);
    set_pin(LCD_CTRL_RST,1);
    wait_ms(200);
    set_pin(LCD_CTRL_RST,0);

    wait_ms(10);
    set_pin(LCD_CTRL_RST,0);
    wait_ms(120);

    wait_ms(10);

    write_cmd(0x3A); // Pixel Format
    write_data(0x55); // 16bit Color

    write_cmd(0xB1); // Frame Control
    write_data(0);
    write_data(0x1f);

    write_cmd(0x36); // Memory Access Control
    write_data(0xE8); // MY MX MV BGR

    write_cmd(0x11); // Sleep Out
    wait_ms(5);

    write_cmd(0x29); // Display On
}

void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1)
{
 write_cmd(0x2A); // Column Address Set
 write_data(x0 >> 8);
 write_data(x0);
 write_data(x1 >> 8);
 write_data(x1);

 write_cmd(0x2B); // Page Address Set
 write_data(y0 >> 8);
 write_data(y0);
 write_data(y1 >> 8);
 write_data(y1);

 write_cmd(0x2C); // Memory Write

 wait_ms(20);


}

void lcd_clear(uint16_t color)
{
   lcd_set_window(0, 0, LCD_WIDTH, LCD_HEIGHT);
   set_pin(LCD_CTRL_DC,1);

   for (int i = 0; i < LCD_WIDTH * LCD_HEIGHT; ++i)
   {
       spi_write(color & 0xff);
       spi_write(color >> 8);
   }
}
