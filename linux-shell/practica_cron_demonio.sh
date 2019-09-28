#!/bin/bash

echo ""
echo "******************************"
echo "**** Practica  Mi Cron  ******"
echo "****      Demonio       ******"
echo "******************************"

cont=5

verificar () {
	seg_acumulado=`date +%s`
	contador=$((seg_acumulado / 60))
	echo "$contador"
	echo "******************************"
	echo "[Corriendo...]"
	date +%F' '%T
	echo "******************************"
	echo ""
	while read -r line; do verifica_fila $line $contador; done < practica_cron.config
}

verifica_fila(){
	
	str=$line
	contador=$contador
	 
	IFS='|' # space is set as delimiter
	read -ra ARRAY <<< "$str" # str is read into an array as tokens separated by IFS

	echo ""
	echo "------------------------------------"
	echo "Comando:	${ARRAY[0]}"
	echo "Creacion:	${ARRAY[1]}"
	echo "Cada:		${ARRAY[2]} min."
	echo "Comando:	${ARRAY[3]}"
	echo ""

	frecuencia=${ARRAY[2]}
	comando=${ARRAY[2]}
	falta=$(( $frecuencia - ($contador%$frecuencia) ))
	

	seg=`date +%S`

	if [ $seg == '00' ]; then
		if [ $(($contador%$frecuencia)) == 0 ]; then
			echo "Ejecutando Proceso: ";eval "${ARRAY[3]}";
		fi	  
	else
	  echo "esperando $falta min..."
	fi



}

export -f verificar
export -f verifica_fila

watch -n 1 --exec bash -c "verificar $cont";echo "$cont"