from migen import *

from litex.soc.interconnect.csr import *

# @FABELTRANM  unal 2019
# Modulo ejemplo para crear perifericos conectados con wishbone
# Recuerde:
#     CSRStorage: permite leer  y escribir en el Registro del periferico desde el procesador
#     CSRStatus:  Unicamente leer el valor dle Reg  
#     la comunicación del software  con el peroférico se facilita conel archivo csr.h


class _GenericP(Module, AutoCSR):
    def __init__(self):
        self.RegRW = RegRW1 = Signal(32)
        self.RegR  = RegR  = Signal(32)
       
        # # #
        RegR=20;
 
       # ingrese la lógica respectiva  para el periferico
        self.sync += [

 
        ]

        self.comb += [

        ]





class GenericP(Module, AutoCSR):
    def __init__(self):
        self.RegRW = CSRStorage(32)
        self.RegR = CSRStatus(32)
     
        # # #

        _genericP = _GenericP()
        self.submodules += _genericP

        self.comb += [
           _genericP.RegRW.eq(self.RegRW.storage),
            _genericP.RegR.eq(self.RegR.status),
        ]

