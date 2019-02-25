
#!/usr/bin/env python3
from migen import *

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform

#from litex.soc.integration.soc_core import *
import litex.soc.integration.soc_core as sc

from litex.soc.integration.builder import *

from litex.soc.cores.uart import UARTWishboneBridge


from ios import Led

#
# platform quacho basic AT
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

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment)

#
# design
#

def csr_map_update(csr_map, csr_peripherals):
    csr_map.update(dict((n, v)
        for v, n in enumerate(csr_peripherals, start=max(csr_map.values()) + 1)))


# create our platform (fpga interface)
platform = Platform()

# create our soc (fpga description)
class BaseSoC(sc.SoCCore):
    # Peripherals CSR declaration
    csr_peripherals = [
        "leds"
    ]
    print (sc.SoCCore.csr_map)

    csr_map_update(sc.SoCCore.csr_map, csr_peripherals)

    print (sc.SoCCore.csr_map)

    def __init__(self, platform, **kwargs):
        sys_clk_freq = int(32e6)
        # SoC init (No CPU, we controlling the SoC with UART)
        sc.SoCCore.__init__(self, platform, sys_clk_freq,
            cpu_type=None,
            csr_data_width=32,
            with_uart=False,
            with_timer=True,
            ident="My first System On Chip", ident_version=True,
            shadow_base=0x00000000,
        )

        # Clock Reset Generation
        self.submodules.crg = CRG(platform.request("clk32"), ~platform.request("cpu_reset"))

        # No CPU, use Serial to control Wishbone bus
        self.add_cpu(UARTWishboneBridge(platform.request("serial"), sys_clk_freq, baudrate=115200))

        self.add_wb_master(self.cpu.wishbone)


        # FPGA identification

        # Led
        user_leds = Cat(*[platform.request("user_led", i) for i in range(9)])
        self.submodules.leds = Led(user_leds)



soc = BaseSoC(platform)

#
# build
#
builder = Builder(soc, output_dir="build", csr_csv="test/csr.csv")
builder.build()
