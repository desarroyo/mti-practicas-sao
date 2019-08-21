#!/bin/bash
#

echo "\n\n"
echo "******************************"
echo "*********** Menu *************"
echo "******************************"
echo " 1.	Listar procesos"
echo " 2.	Dia y Hora"
echo " 3.	Eliminar proceso"
echo " 4.	Crear un archivo"
echo " 5.	Salir"
echo "******************************"
echo -n "Opción: "
read opcion
echo "\n\n"

case $opcion in
1) echo "Listar procesos: \n";
ps && sh practica2.sh;;
2) echo "Dia y Hora";
date +"%d-%m-%y %H:%M";
sh practica2.sh;;
3) echo "Eliminar proceso";
echo -n "Id Proceso: ";
read id_proceso;
ps -p $id_proceso -o comm=;
kill $id_proceso;
sh practica2.sh;;
4) echo "Crear un archivo";
echo -n "Nombre del archivo: ";
read filename;
touch "$filename.txt";
stat "$filename.txt"
sh practica2.sh;;
5) echo "Fin";
exit 1;;
*) echo "$opcion es una opcion invalida?";
echo "Presiona una tecla para continuar...";

;;
esac
