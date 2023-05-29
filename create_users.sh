#!/bin/bash
function usage(){
    #INDICAM LES INSTRUCCIONS DEL SCRIPT
    echo "INSTRUCCIONS: ./create_users.sh USER_NAME [USER_NAME ... ]"
    echo "EXECUTAR COM A ROOT"
    exit 1
}
#COMPROVAR QUE SOU ROOT
if [ ${UID} -ne 0 ]
then
    usage
fi
# El nom del script que s'executa
echo "${0}"
# El PATH i el filename del script
echo "direcori: $(dirname ${0}) fitxer: $(basename ${0})"
# El número de paràmetres
NUMERO_PARAMETRES=${#}
echo "NUMERO DE PARAMETRES: ${NUMERO_PARAMETRES}"
# Si el número de paràmetres és igual zero ha de sortir (exit 1),
#indicant que el primer paràmetre és obligatori i que rebrà de nom USER_NAME, 
#i que pot rebre paràmetres opcionals que també seran noms d'usuaris.
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
    #errada, necessitam al manco un paràmetre
    usage
fi

# Generau un password per cada un dels usuaris passats com a paràmetres.
# for és un bucle, que s'executa per cada element de ${@}
for USER_NAME in ${@}
do
    #ENTRAREM DINS AQUEST BLOC, TANTES VEGADES COM PARÀMETRES POSEM AL SCRIPT
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"

    #CREAR L'USUARI amb el HOME (OPCIÓ -m)
    useradd -m ${USER_NAME} 
    #COMPROVAM SI S'HA CREAT BÉ

    
    #CANVIAM PASSWORD

    #comprovam si el canvi de password ha anat bé.

    #FER QUE L'USARI HAGI DE CANVIAR EL PASSWORD AL PRIMER LOGIN

done








