from migen import *

from migen.genlib.io import CRG

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

import litex.soc.integration.soc_core as SC
from litex.soc.integration.builder import *

from ios import Led
#
# platform
#

_io = [


    ("user_led",  0, Pins("P24"), IOStandard("LVCMOS33")),
    ("user_led",  1, Pins("P27"), IOStandard("LVCMOS33")),
    ("user_led",  2, Pins("P32"), IOStandard("LVCMOS33")),
    ("user_led",  3, Pins("P34"), IOStandard("LVCMOS33")),
    ("user_led",  4, Pins("P61"), IOStandard("LVCMOS33")),
    ("user_led",  5, Pins("P74"), IOStandard("LVCMOS33")),
    ("user_led",  6, Pins("P62"), IOStandard("LVCMOS33")),
    ("user_led",  7, Pins("P78"), IOStandard("LVCMOS33")),
    ("user_led",  8, Pins("P80"), IOStandard("LVCMOS33")),


    ("clk32", 0, Pins("P126"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("P87"), IOStandard("LVCMOS33")),

    ("serial", 0,
        Subsignal("tx", Pins("P105")),
        Subsignal("rx", Pins("P101")),
        IOStandard("LVCMOS33"),
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

# create our soc (fpga description)
class BaseSoC(SC.SoCCore):
    # Peripherals CSR declaration
    csr_peripherals = {
      "leds": 2
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

 # Led
        user_leds = Cat(*[platform.request("user_led", i) for i in range(9)])
        self.submodules.leds = Led(user_leds)


soc = BaseSoC(platform)




#
# build
#

builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
