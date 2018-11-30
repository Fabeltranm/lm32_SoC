# 2018 noviembre
# script de configiración e intalacion de litx migen y core de litex
# elaborado por Ferney Alberto Beltran , 
# modifica el script  litex_setup.py https://github.com/enjoy-digital/litex
# email fabeltranm@gunal.edu.co

#!/usr/bin/env python3
import os

import os
import sys
from collections import OrderedDict


dir_install="/opt/liteX"

# clean
os.system("rm -rf " + dir_install)
os.system("mkdir " + dir_install)

# name,  (url, recursive clone, develop)
repos = [
    ("migen",      ("http://github.com/m-labs/",        True,  True)),
    ("litex",      ("http://github.com/enjoy-digital/", True,  True)),
    ("liteeth",    ("http://github.com/enjoy-digital/", False, True)),
    ("liteusb",    ("http://github.com/enjoy-digital/", False, True)),
    ("litedram",   ("http://github.com/enjoy-digital/", False, True)),
    ("litepcie",   ("http://github.com/enjoy-digital/", False, True)),
    ("litesdcard", ("http://github.com/enjoy-digital/", False, True)),
    ("liteiclink", ("http://github.com/enjoy-digital/", False, True)),
    ("litevideo",  ("http://github.com/enjoy-digital/", False, True)),
    ("litescope",  ("http://github.com/enjoy-digital/", False, True)),
]
repos = OrderedDict(repos)


script_path = os.path.dirname(os.path.realpath(__file__))


for name in repos.keys():
    url, need_recursive, need_develop = repos[name]
    # clone repo (recursive if needed)
    print("[cloning " + name + "]...")
    full_url = url + name
    opts = "--recursive" if need_recursive else ""
    os.system("git clone " + full_url + " " + opts)
    os.system("mv " + name + " " + dir_install +"/")

os.chdir(dir_install)
os.system("cp /opt/liteX/litex/litex_setup.py .")

for name in repos.keys():
    url, need_recursive, need_develop = repos[name]
    # develop if needed
    print("[installing " + name + "]...")
    if need_develop:
        os.chdir(os.path.join(dir_install, name))
        os.system("python3 setup.py develop")

print("........................................................................ ")
print("             Sistemas instaladoS en " +dir_install+ " \n")
for name in repos.keys():
    print("-> " + name)
 
print("........................................................................ ")

print("CUAnDO REQUIERA ACTUALIZAR EL SISTEMA DEBE EJECUTAR EL SIGUIENTE COMANDO: ")
print( "    <  sudo python3 " + dir_install+"/litex_setup.py update > \n")




