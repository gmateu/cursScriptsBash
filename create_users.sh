#!/bin/bash
function usage(){
    #INDICAM LES INSTRUCCIONS DEL SCRIPT
    echo "INSTRUCCIONS: ./create_users.sh USER_NAME [USER_NAME ... ]"
    exit 1
}

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
# Afegir tots els paràmetres dins una variable i mostrar-la per pantalla.
TOTS_ELS_PARAMETRES=${*}
echo "TOTS ELS PARÀMETRES: ${TOTS_ELS_PARAMETRES}"
# DESPLAÇAR ELS PARÀMeTRES A L'ESQUERRA
# shift
# #TORNAR A MOSTRAR TOTS ELS PARÀMETRES
# TOTS_ELS_PARAMETRES=${*}
# echo "TOTS ELS PARÀMETRES: ${TOTS_ELS_PARAMETRES}"
# Generau un password per cada un dels usuaris passats com a paràmetres.
# for és un bucle, que s'executa per cada element de ${@}
for USER_NAME in ${@}
do
    #ENTRAREM DINS AQUEST BLOC, TANTES VEGADES COM PARÀMETRES POSEM AL SCRIPT
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"

    #CREAR L'USUARI AMB AQUEST PASSWORD,
    #FER QUE L'USARI HAGI DE CANVIAR EL PASSWORD AL PRIMER LOGIN
    #I QUE ES CREI EL HOME PER AQUEST USUARI
done








