#!/bin/bash

#Genera un nombre aleatori entre 1 i 10:
ADIVINA=$(( ( RANDOM % 10 )  + 1 ))
echo "ADIVINA: ${ADIVINA}"

########################################################
# Escriu el teu codi aqui
########################################################
VIDES=3
while [[ ${VIDES} -ne 0 ]]
do
    echo "VIDES: ${VIDES}"
    read -p "INTRODUEIX UN NÚMERO: " INTRODUIT
    if [[ ${ADIVINA} -eq ${INTRODUIT} ]]
    then
        echo "EUREKA!!"
        exit 0
    fi

    if [[ ${INTRODUIT} -lt ${ADIVINA} ]]
    then
        echo "FRED"
    else
        echo "CALENT"
    fi
    VIDES=$((VIDES-1))
done



########################################################
# Fi del teu codi
########################################################
echo "HAS PERDUT, EL NÚMERO ERA: ${ADIVINA}"
