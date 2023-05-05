#!/bin/bash

for line in $(cat /etc/passwd)
do
    echo $line | awk -F: '$3>=0 {print $1 , $3}'
    USER=$(echo $line | awk -F: '$3>=0 {print $1}')
    NUM=$(echo $line | awk -F: '$3>=0 {print $3}')
    echo "user: $USER"
    echo "UID: $NUM"
done