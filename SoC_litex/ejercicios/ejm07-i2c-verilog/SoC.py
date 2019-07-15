from migen import *

from migen.genlib.io import CRG

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

import litex.soc.integration.soc_core as SC
from litex.soc.integration.builder import *

from I2CMaster import I2C_MAster



#
# platform
#

_io = [


    ("clk32", 0, Pins("P126"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("P87"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("P105")),
        Subsignal("rx", Pins("P101")),
        IOStandard("LVCMOS33"),
    ),


    ("i2c_master", 0,
    	Subsignal("scl", Pins("P29")),
        Subsignal("sda", Pins("P30")),
        IOStandard("LVCMOS33")
    ),
]


class Platform(XilinxPlatform):
    default_clk_name = "clk32"
    default_clk_period = 31.25

    def __init__(self):
        XilinxPlatform.__init__(self, "xc6slx9-TQG144-2", _io, toolchain="ise")
#        XilinxPlatform.__init__(self, "xc7a100t-CSG324-1", _io, toolchain="ise")

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment, ngdbuild_opt="ngdbuild -p")


#
# design
#

# create our platform (fpga interface)
platform = Platform()
platform.add_source("i2c_verilog/i2c.v")
platform.add_source("i2c_verilog/i2c_master_byte_ctrl.v")
platform.add_source("i2c_verilog/i2c_master_bit_ctrl.v")
platform.add_source("i2c_verilog/i2c_master_defines.v")
platform.add_source("i2c_verilog/timescale.v")

# create our soc (fpga description)
class BaseSoC(SC.SoCCore):
    # Peripherals CSR declaration
    csr_peripherals = {
      "leds": 2,
      "i2c": 3
    }
    SC.SoCCore.csr_map= csr_peripherals

    def __init__(self, platform):
        sys_clk_freq = int(32e6)
        # SoC with CPU
        SC.SoCCore.__init__(self, platform,
            cpu_type="lm32",
            clk_freq=32e6,
            ident="CPU Test SoC", ident_version=True,
            integrated_rom_size=0x8000,
            csr_data_width=32,
            integrated_main_ram_size=16*1024)

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk32"), ~platform.request("cpu_reset"))

	# Spi
        self.submodules.i2c = I2C_MAster(platform.request("i2c_master"))


soc = BaseSoC(platform)


#
# build
#
builder = Builder(soc, output_dir="build", csr_csv="csr.csv")

builder.build()

