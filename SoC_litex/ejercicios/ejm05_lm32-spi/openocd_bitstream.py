
from litex.build.generic_programmer import GenericProgrammer

import subprocess

class OpenOCD(GenericProgrammer):
    needs_bitreverse = False

    def __init__(self, config, flash_proxy_basename=None):
        GenericProgrammer.__init__(self, flash_proxy_basename)
        self.config = config

    def load_bitstream(self, bitstream):
        script = "; ".join([
            "init",
            "pld load 0 {{{}}}".format(bitstream),
            "exit",
        ])
        print(["openocd", "-f", self.config, "-c", script])
  #      subprocess.call(["../openocd/src/openocd", "-f", self.config, "-c", script])
        subprocess.call(["openocd", "-f", self.config, "-c", script])


    def flash(self, address, data):
        flash_proxy = self.find_flash_proxy()
        script = "; ".join([
            "init",
            "jtagspi_init 0 {{{}}}".format(flash_proxy),
            "jtagspi_program {{{}}} 0x{:x}".format(data, address),
            "fpga_program",
            "exit"
        ])
        print(["openocd", "-f", self.config, "-c", script])
   
    def flash2(self, data):
        script = "; ".join([
            "init",
            "jtagspi_init 0 {{{}}}".format('bscan_spi_xc6slx9.bit'),
            "jtagspi_program {{{}}} 0".format(data),
            "xc6s_program xc6s.tap",
            "shutdown"
        ])
        print(["openocd", "-f", self.config, "-c", script])
        subprocess.call(["../openocd-code/src/openocd", "-f", self.config, "-c", script])


op=OpenOCD("quacho_basic_at.cfg")
op.load_bitstream("build/gateware/top.bit")
#op.flash2("build/gateware/top.bit")

