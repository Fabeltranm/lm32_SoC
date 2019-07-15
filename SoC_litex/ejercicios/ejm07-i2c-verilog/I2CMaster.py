#!/usr/bin/python3

from migen import *
from migen.build.generic_platform import *
from migen.build.xilinx import XilinxPlatform
from litex.soc.interconnect.csr import *


class I2C_MAster(Module,AutoCSR):
	def __init__(self, pads, clk=ClockSignal()):

		self.rst = Signal()
		self.clk =clk
		self.prescale = CSRStorage(16)
		self.control = CSRStorage(8)
		self.transmit = CSRStorage(8)
		self.receive = CSRStorage(8)
		self.command = CSRStorage(8)
		self.status = CSRStorage(8)


    ##Instancia
		self.specials +=[Instance("i2c",
            i_I2C_clk      = self.clk,
            i_I2C_rst      = self.rst,
            i_prescale    = self.prescale.storage,
            i_control = self.control.storage,
            i_transmit = self.transmit.storage,
            o_receive = self.receive.storage,
            i_command = self.command.storage,
            o_status = self.status.storage,
            io_scl = pads.scl,
            io_sda = pads.sda,
        )]


def _test(dut):
	yield dut.rst.eq(0)
	yield
	yield
	yield dut.rst.eq(1)



def main():

	dut = I2C()
	print(verilog.convert(dut))
	print("\nRunning Sim...\n")
	run_simulation(dut,_test(dut))

	
if __name__ == "__main__":
	main()
	
