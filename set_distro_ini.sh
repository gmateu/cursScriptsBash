#!/bin/bash
function usage(){
    echo "you must be root"
    exit 1
}

function action(){
    echo "--------------------------"
    echo "${1}"
    echo "--------------------------"
    echo ""
}

if [[ ${UID} -ne 0 ]]
then 
    usage
fi

action "script executat des de github"

action "UPDATE DISTRO"
apt update && apt upgrade -y

action "INSTALL CURL"
apt install curl -y

action "INSTALL SUDO"
apt install sudo -y

