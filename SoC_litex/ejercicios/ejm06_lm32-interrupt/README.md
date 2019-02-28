# Interrupts

## Configuración en hardware

Las interrupciones del periférico, desde litex, se administran con el módulo `EventManager()`. Por lo tanto, cada modulo, periférico, que interrumpe la unidad de control, debe contar con el submódulo:


```python

from litex.soc.interconnect.csr_eventmanager import *

def __init__(self):
        self.submodules.ev = EventManager()

```

Adicionalmente, se debe especificar que tipo de interrupción es: si se interrumpe cuando hay flanco de subida , flanco de bajada o por nivel, para ello se debe adicionar los submódulos  EventSourcePulse (), EventSourceProcess () o EventSourceLevel (), respectivamente.

En los tres tipos de interrupción, al llegar el evento se activa la señal IRQ, activando el bit respectivo de pending. Para ser atendida esta interrupción se debe agregar el bit pending al Vector de interrupciones del procesador. A continuación, se presenta un fragmento del la descripción del modulo Timer, que se encuentra en el archivo Timer.py.

```python
class Timer(Module, AutoCSR):
    def __init__(self, width=32):
        self._load = CSRStorage(width)
        self._reload = CSRStorage(width)
        self._en = CSRStorage()
        self._update_value = CSR()
        self._value = CSRStatus(width)

        self.submodules.ev = EventManager()
        self.ev.zero = EventSourceProcess()
        self.ev.finalize()

        ###

        value = Signal(width)
        self.sync += [
        .... # el archivo original tiene el código  completo
        ]
        self.comb += self.ev.zero.trigger.eq(value != 0)

```

La descripción del hardware del timer, incluye la señal de interrupción zero, que se activa cuando el valor del contador value llega a cero, y es genenerada con el evento
EventSourceProcess(). lo que indica que el bit 1 del regsitro IP se activa con un flanco de bajada.

El procesador LM32, tiene solo un registro de interrupciones, el registro IP. LiteX se encarga de conectar las señales de interrupción de cada módulo  con el registro IP. En el archivo soc_core.py, se encuentra el directorio de interrupciones, interrupt_map{}, y por defecto se ubican en los bit 1 y 2 del vector de interrupciones, los eventos generados por el modulo timer y la uart, respectivamente.

```python
    interrupt_map = {}
    soc_interrupt_map = {
        "timer0": 1, # LiteX Timer
        "uart":   2, # LiteX UART
    }

```
Para actualizar el mapa de interrupciones,  en el momento de instancia em SoC, se debe generar un mapa de interrupciones y actualizar el mapa del SoC. a continuación se presenta parte del código ejemplo 06:

```python
# interrupts declaration
    interrupt_map = {
        "buttons" : 4,
    }
    SC.SoCCore.interrupt_map.update(interrupt_map)
    print (SC.SoCCore.interrupt_map)

```

En la descripción de hardware, se observa que la interrupción generada por los botones se ubica en el bit 4 del registro de interrupciones.


RECUERDE QUE LAS INTERRUPCIONES SON SEÑALES  QUE NO VAN CONECTADOS POR EL BUS WISHBONE. SON SEÑALES QUE INDICAN UN EVENTO DE ATENCIÓN INMEDIATA

# Configuración en software

Ahora bien, una vez realizada la conexión fisica entre el procesado y los eventos del periférico se debe administrar el cómo el procesador atiende esta IRQ.
en el caso del procesador LM32, se cuenta con tres registro :

IE  0x00 (R/W) Interrupt enable
IM  0x01 (R/W) Interrupt mask
IP  0x02 (R)   Interrupt pending

IE, indica si se  habilitan o no las interrupciones globales. Siempre debe estar activo, de lo contrario, el procesador no se interrunpe, así un periférico genere un evento. Por lo tanto, para activar desde el software las interrupciones generales  se debe usar la siguiente función.

```python
	irq_setie(1);
```
