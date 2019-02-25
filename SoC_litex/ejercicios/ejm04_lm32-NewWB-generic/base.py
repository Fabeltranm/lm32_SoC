from migen import *

from migen.genlib.io import CRG

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

import litex.soc.integration.soc_core as SC
from litex.soc.integration.builder import *

import pwm as PWM
import generico as generic

#
# platform
#

_io = [

    ("clk32", 0, Pins("P126"), IOStandard("LVCMOS33")),

    ("cpu_reset", 0, Pins("P87"), IOStandard("LVCMOS33")),

    ("pwm1", 0, Pins("P24"), IOStandard("LVCMOS33")),

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
        XilinxPlatform.do_finalize(self, fragment)


def csr_map_update(csr_map, csr_peripherals):
    csr_map.update(dict((n, v)
        for v, n in enumerate(csr_peripherals, start=max(csr_map.values()) + 1)))

#
# design
#

# create our platform (fpga interface)
platform = Platform()

# create our soc (fpga description)
class BaseSoC(SC.SoCCore):
    # Peripherals CSR declaration
    csr_peripherals = [
      "pwm",
      "generic"
    ]
    csr_map_update(SC.SoCCore.csr_map, csr_peripherals)
    print (SC.SoCCore.csr_map)
    def __init__(self, platform):
        sys_clk_freq = int(32e6)
        # SoC with CPU
        SC.SoCCore.__init__(self, platform,
            cpu_type="lm32",
            clk_freq=32e6,
            csr_data_width=32,
            ident="CPU Test SoC", ident_version=True,
            integrated_rom_size=0x8000,
            integrated_main_ram_size=16*1024)

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk32"), ~platform.request("cpu_reset"))


        # pwm
        self.submodules.pwm  = PWM.PWM(platform.request("pwm1",  0))
        # generic
        self.submodules.generic  = generic.GenericP()
      
soc = BaseSoC(platform)

#
# build
#

builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
