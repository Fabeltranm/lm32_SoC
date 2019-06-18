#ifndef __LCD_SPI_H
#define __LCD_SPI_H

#include <generated/csr.h>

// config signal spi
#define OFFLINE      0
#define PADDING0     1
#define CS_POLARITY  3
#define CLK_POLARITY 4
#define CLK_PHASE    5
#define LSB_FIRST    6
#define HALF_DUPLEX  7
#define PADDING1     8
#define DIV_WRITE    16
#define DIV_READ     24

// COBFIG REGISTER XFER
#define XFER_CS 0
#define XFER_WRITE_LENGTH 16
#define XFER_PADDING0 22
#define XFER_READ_LENGTH 24
#define XFER_PADDING1 30


#define LCD_WIDTH 320
#define LCD_HEIGHT 240


#define LCD_BLUE    0x1F00
#define LCD_RED     0x00F8
#define LCD_GREEN   0xE007
#define LCD_YELLOW  0xE0FF

/* señales de control del lcd */
#define LCD_CTRL_RST 0
#define LCD_CTRL_DC  1
#define LCD_CTRL_LED 2

void set_pin(uint8_t npin, uint8_t value);
void lcd_clear(uint16_t color);
void lcd_set_window(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
void lcd_reset(void);
void write_cmd(uint8_t cmd);

void spi_init(void);



#endif
