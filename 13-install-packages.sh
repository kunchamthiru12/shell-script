#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>>$LOGFILE
VALIDATE(){
    if [$1 -ne 0]
    then 
         echo -e "$2 ... $R Failed $N"
    else
         echo -e "$2 ... $G success $N"     
}


if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run the script with root access $N"
    exit 1
else
    echo "you are root user"
fi # fi means revers of if ,indicating condition end

#echo "all argumebnts passed: $@"
#git mysql postfix net-tools
#package=git for first time

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0]
    then
         yum install $package -y  &>> $LOGFILE# install the package
         VALIDATE $? "Installation of $package" #validate
    else
        echo -e "$package is already installed ... $Y SKIPPING %$N"
    fi         
done    
    
