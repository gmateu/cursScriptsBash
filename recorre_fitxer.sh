#!/bin/bash
#ESCRIU UN SCRIPT QUE RECORRI EL FITXER numeros.txt i
#mostri QUANTES LÍNIES TÉ EL FIXER I QUE CALCULI LA MITJANA ARITMÈTICA DELS NÚMEROS
NUMERO_LINIES=0
SUMA=0
for linia in $(cat numeros.txt)
do 
    #INCREMENTAM EL NÚMERO DE LINIES
    NUMERO_LINIES=$((NUMERO_LINIES+1))
    SUMA=$((SUMA+linia))
done
echo "numero de linies: ${NUMERO_LINIES}"
echo "la suma val: ${SUMA}"
#MITJANA = SUMA DIVIDIT EL NUMERO DE LINIES
MITJANA=$(echo "scale=3; ${SUMA}/${NUMERO_LINIES}" | bc)
echo "la mitjana val ${MITJANA}"