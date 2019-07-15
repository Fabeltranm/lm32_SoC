#include "i2c.h"
#include <generated/csr.h>





void i2c_init(void){

	uint32_t div_write= SYSTEM_CLOCK_FREQUENCY/(5*FREQ_SCL)-1;
    	i2c_prescale_write(div_write);
 	
	i2c_control_write(0x80);

}

/*
I2C Sequence:
1) generate start command 2) write slave address + write bit
3) receive acknowledge from slave 4) write data
5) receive acknowledge from slave 6) generate stop command
*/

uint8_t _send(uint8_t dat){
	i2c_transmit_write(dat);
	i2c_command_write(CSTA+CTX);
	while (STIP && i2c_status_read());
	if (SRxACK && i2c_status_read())
		return 0;
	else
		return 1;

}
uint8_t i2c_write(uint8_t addr, uint8_t dato){

	if (_send(addr<<1 + 0))
		if (_send(dato))
			return 1;
	return 0;


 
}

