#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"


if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run the script with root access $N"
    exit 1
else
    echo "you are root user"
fi

echo "all argumebnts passed: $@"
    
