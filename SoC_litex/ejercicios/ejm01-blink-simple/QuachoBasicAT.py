from migen import *
from migen.build.generic_platform import *
from migen.build.xilinx import XilinxPlatform

#
# platform QUACHO BASIC AT
#

_io = [
    ("user_led1",  0, Pins("P24"), IOStandard("LVCMOS33")),
    ("user_led2",  0, Pins("P27"), IOStandard("LVCMOS33")),
    ("user_led3",  0, Pins("P32"), IOStandard("LVCMOS33")),
    ("user_led4",  0, Pins("P34"), IOStandard("LVCMOS33")),
    ("user_led5",  0, Pins("P61"), IOStandard("LVCMOS33")),
    ("user_led6",  0, Pins("P74"), IOStandard("LVCMOS33")),
    ("user_led7",  0, Pins("P62"), IOStandard("LVCMOS33")),
    ("user_led8",  0, Pins("P78"), IOStandard("LVCMOS33")),

    ("clk32", 0, Pins("P126"), IOStandard("LVCMOS33")),

]


class Platform(XilinxPlatform):
    default_clk_name = "clk32"
    default_clk_period = 31.25

    def __init__(self):
        XilinxPlatform.__init__(self, "xc6slx9-TQG144-2", _io, toolchain="ise")
#        XilinxPlatform.__init__(self, "xc7a100t-CSG324-1", _io, toolchain="ise")

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment)

#
# design
#


# create our platform (fpga interface)
platform = Platform()
led1 = platform.request("user_led1")
led2 = platform.request("user_led2")
led3 = platform.request("user_led3")
led4 = platform.request("user_led4")
led5 = platform.request("user_led5")
led6 = platform.request("user_led6")
led7 = platform.request("user_led7")
led8 = platform.request("user_led8")

# create our module (fpga description)
module = Module()

# create a counter and blink a led
bl=30
counter = Signal(bl)
module.comb += led1.eq(counter[bl-1])
module.comb += led2.eq(counter[bl-2])
module.comb += led3.eq(counter[bl-3])
module.comb += led4.eq(counter[bl-4])
module.comb += led5.eq(counter[bl-5])
module.comb += led6.eq(counter[bl-6])
module.comb += led7.eq(counter[bl-7])
module.comb += led8.eq(counter[bl-8])

module.sync += counter.eq(counter + 1)

#
# build
#

platform.build(module)
