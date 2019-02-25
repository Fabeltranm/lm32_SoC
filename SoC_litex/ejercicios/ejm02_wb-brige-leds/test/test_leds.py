#!/usr/bin/env python3

import time
import random

from litex.soc.tools.remote import RemoteClient

wb = RemoteClient()
wb.open()

# # #

# test led
print("Testing Led...")

while (1):
    for j in range(2):
        for i in range(9):
            print (i)
            if(j):
                wb.regs.leds_out.write(~(2**i))
            else:
                wb.regs.leds_out.write(~(256//(2**i)))
            
            time.sleep(0.05)




# # #

wb.close()
