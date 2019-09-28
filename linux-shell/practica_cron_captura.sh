#!/bin/bash
#

menu () {
	clear
	echo ""
	echo "******************************"
	echo "**** Practica  Mi Cron  ******"
	echo "****      Captura       ******"
	echo "******************************"
	echo " 1.	Alta de Proceso"
	echo " 2.	Baja de Proceso"
	echo " 3.	Consultar"
	echo " 4.	Salir"
	echo "******************************"
	echo -n "Opción: "
	read opcion


	case $opcion in
	1) echo "Alta de Proceso ";
		echo "Nombre: ";
		read nombre;
		fecha=$(date +%F' '%T)
		echo "¿Cada cuantos minutos?: ";
		read minuto;
		echo "Escribe un comando: ";
		read comando;
		echo "$nombre|$fecha|$minuto|$comando" >> practica_cron.config;
		menu;;
	2) echo "Baja de Proceso ";
		echo -n "Nombre: ";
		read nombre_borrar;
		grep -v "^$nombre_borrar|*" practica_cron.config > practica_cron.temp;
		rm -rf practica_cron.config;
		mv practica_cron.temp practica_cron.config;
		menu;;
	3) echo "Consultar ";
		while read -r line; do echo $line; done < practica_cron.config; read -n 1 -s -r -p "Presiona una tecla para continuar...";
		menu;;
	4) echo "Fin ";
		exit 1;;

	*) echo "$opcion es una opcion invalida";
		read -n 1 -s -r -p "Presiona una tecla para continuar...";
		menu;


	;;
	esac
}


menu

