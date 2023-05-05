#!/bin/bash
function usage(){
    echo "USAGE: you have to enter almost 2 parameters"
    echo "params_classe.sh x1 x2 [x3...xn]"
    exit 1
}

NUM_PARAM=${#}
echo "numéro de paràmetres: ${NUM_PARAM}"
if [[ ${NUM_PARAM} -lt 2 ]]
then
    #error per el número de paràmetres
    usage
fi

# FOR ESTRUCTURA DE CONTROR PER ITERAR
SUMA=0
PRODUCTE=1
for I in ${@}
do
    SUMA=$((SUMA+I))
    PRODUCTE=$((PRODUCTE*I))
done
echo "LA SUMA VAL ${SUMA}"
echo "EL PRODUCTE VAL ${PRODUCTE}"