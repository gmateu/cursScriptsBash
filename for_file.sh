#!/bin/bash

for line in $(cat /etc/passwd)
do
    USER=$(echo $line | awk -F: '$3>=0 {print $1}')
    echo "user: $USER"
done