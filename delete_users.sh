#!/bin/bash
function usage(){
    #INDICAM LES INSTRUCCIONS DEL SCRIPT
    echo "INSTRUCCIONS: ./delete_users.sh USER_NAME [USER_NAME ... ]"
    echo "EXECUTAR COM A ROOT"
    exit 1
}
#COMPROVAR QUE SOU ROOT
if [ ${UID} -ne 0 ]
then
    usage
fi
# El nom del script que s'executa
# El número de paràmetres
NUMERO_PARAMETRES=${#}
# Si el número de paràmetres és igual zero ha de sortir (exit 1),
#indicant que el primer paràmetre és obligatori i que rebrà de nom USER_NAME, 
#i que pot rebre paràmetres opcionals que també seran noms d'usuaris.
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
    #errada, necessitam al manco un paràmetre
    usage
fi

# for és un bucle, que s'executa per cada element de ${@}
for USER_NAME in ${@}
do
    #ENTRAREM DINS AQUEST BLOC, TANTES VEGADES COM PARÀMETRES POSEM AL SCRIPT
    #ELIMINAR  L'USUARI amb el HOME 
        
    #COMPROVAM SI HA HAGUT ALGUNA ERRADA
    if [[ ${?} -ne 0 ]]
    then
        #si entram aquí és pq hi ha una errada
        echo "ERRADA BORRANT USUARI"
        exit 1
    fi

    

done








