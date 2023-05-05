#!/bin/bash

NUMBER=$(( RANDOM % 10 + 1 ))

echo "${NUMBER}"

WIN=0
TRIES=0

while [[ ${WIN} -ne 1 ]]
do
    echo "playing"
    TRIES=$(( TRIES + 1 ))
    read -p "GUESS A NUMBER: " YOUR_NUMBER
    if [[ ${NUMBER} -eq ${YOUR_NUMBER} ]]
    then
        WIN=1
        echo "YOU WIN!! IN ${TRIES} tries"
    fi
done