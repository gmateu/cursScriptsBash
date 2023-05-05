#!/bin/bash
function usage(){
    echo "Usage: you need mor than one parameter"
    exit 1
}


if [[ ${#} -lt 2 ]]
then
    usage
fi

SUMA=0
for NUM in "${@}"
do
    SUMA=$((SUMA+NUM))
done
echo "SUMA=$SUMA"



