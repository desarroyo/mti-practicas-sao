#!/bin/bash
#

echo "\n\n"
echo "******************************"
echo "******** Practica 3 **********"
echo "******************************"
echo " 1.	Agregar Datos Personales"
echo " 2.	Borrar Nombre"
echo " 3.	Consultar"
echo " 4.	Salir"
echo "******************************"
echo -n "Opción: "
read opcion
echo "\n\n"

case $opcion in
1) echo "Agregar Datos Personales \n";
echo "Tu nombre: ";
read nombre;
echo "$nombre" >> nombres.txt;
sh practica3.sh;;
2) echo "Borrar Nombre \n";
echo -n "Nombre: ";
read nombre_borrar;
sed "/$nombre_borrar/d" nombres.txt >> nombres_temp.txt;
rm -rf nombres.txt;
mv nombres_temp.txt nombres.txt;
sh practica3.sh;;
3) echo "Consultar \n";
nano "nombres.txt";
sh practica3.sh;;
4) echo "Fin \n";
exit 1;;
*) echo "$opcion es una opcion invalida?";
echo "Presiona una tecla para continuar...";

;;
esac
