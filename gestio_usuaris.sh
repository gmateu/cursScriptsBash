#!/bin/bash
#EN FUNCIÓ DEL PRIMER PARÀMETRE CREAREM O ELIMINAREM 
#ELS USUARIS QUE ENS VEGUIN D'UN FIXTER QUE VINDRÀ EN EL SEGON PARÀMETRE
NOM_SCRIPT=${0}
function usage(){
    echo "${NOM_SCRIPT} ACTION FILE_NAME"
    echo "executar com a root"
    exit 1
}

function create_user(){
    echo "create user ___ ${1}"
    USER_NAME=${1}
    #ENTRAREM DINS AQUEST BLOC, TANTES VEGADES COM PARÀMETRES POSEM AL SCRIPT
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"

    #CREAR L'USUARI amb el HOME (OPCIÓ -m)
    useradd -m ${USER_NAME} 
    #COMPROVAM SI HA HAGUT ALGUNA ERRADA
    if [[ ${?} -ne 0 ]]
    then
        #si entram aquí és pq hi ha una errada
        echo "ERRADA CREANT USUARI"
        exit 1
    fi

    
    #CANVIAM PASSWORD
    echo "${USER_NAME}:${PASSWORD}" | chpasswd
    #comprovam si el canvi de password ha anat bé.
    if [[ ${?} -ne 0 ]]
    then
        #si entram aquí és pq hi ha una errada
        echo "ERRADA CANVIANT EL PASSWORD"
        exit 1
    fi

    #FER QUE L'USARI HAGI DE CANVIAR EL PASSWORD AL PRIMER LOGIN
    passwd -e ${USER_NAME}

}
function delete_user(){
    echo "delete user ___ ${1}"
    USER_NAME=${1}
    #ENTRAREM DINS AQUEST BLOC, TANTES VEGADES COM PARÀMETRES POSEM AL SCRIPT
    #ELIMINAR  L'USUARI amb el HOME 
    deluser --remove-home ${USER_NAME}    
    #COMPROVAM SI HA HAGUT ALGUNA ERRADA
    if [[ ${?} -ne 0 ]]
    then
        #si entram aquí és pq hi ha una errada
        echo "ERRADA BORRANT USUARI"
        exit 1
    fi
}

#COMPROVAR QUE SOU ROOT
if [ ${UID} -ne 0 ]
then
    usage
fi

NUMERO_PARAMETRES=${#}
# Si el número de paràmetres és igual zero ha de sortir (exit 1),
#indicant que el primer paràmetre és obligatori i que rebrà de nom USER_NAME, 
#i que pot rebre paràmetres opcionals que també seran noms d'usuaris.
if [[ ${NUMERO_PARAMETRES} -ne 2 ]]
then
    #errada, necessitam al manco un paràmetre
    usage
fi

ACTION=${1}
#LLEGIR ELS USUARIS D'UN FITXER
NOM_FITXER=${2}

for USER in $(cat ${NOM_FITXER})
do
    if [[ ${ACTION} == "create" ]]
    then    
        create_user ${USER}
    elif [[ ${ACTION} == "delete" ]]
    then
        delete_user ${USER}
    else
        echo "ACCIÓ ${ACTION} NO DISPONIBLE"
        exit 1
    fi
done

#ENVIAR UN MISSATGE AL VOSTRE BOT DE TELEGRAM
#INDICANT QUANTS USUARIS S'HAN CREAT O ELIMINAT