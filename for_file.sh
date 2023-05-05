#!/bin/bash

for line in $(cat /etc/passwd)
do
    echo $line | awk -F: '$3>=0 {print $1,$3}'
done