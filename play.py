# This software is released under the Pylar AI creative ML license, see LICENSE.md.

import os

print("Hola, soy Pylar, y voy a ejecturar auto.sh, cuantas veces quires que se ejecute?")
x = int(input())
print("Ejecutare auto.sh, " + str(x) + " veces")
for i in range(x):
    os.system("sh auto.sh")
    os.system("clear")
