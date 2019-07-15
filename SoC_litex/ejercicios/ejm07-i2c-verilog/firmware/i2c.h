#ifndef __I2C_H
#define __I2C_H

#include <generated/csr.h>


#define FREQ_SCL 100 //MHZ


// Command register bit
#define CSTA   0x80 // generate (repeated) start condition.
#define CSTO   0x40 // generate stop condition
#define CRD    0x20 // read from slave
#define CTX    0x10 // write to slave
#define CACK   0x04 // sent ACK (ACK = ‘0’) or NACK (ACK = ‘1’)
#define CIACK  0x01 // Interrupt acknowledge

// status register bit
#define SRxACK 0x80 // Received acknowledge from slave.
#define SBUSY  0x40 // Busy, I2C bus busy
#define STIP   0x02 // Transfer in progress. 
#define SIF    0x01 // Interrupt Flag.



void i2c_init(void);

uint8_t i2c_write(uint8_t addr, uint8_t dato);



#endif
