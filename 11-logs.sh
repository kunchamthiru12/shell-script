#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%s)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOGFILE="/tmp/$0-$TIMESTAMP.log"

 echo "script started executing at $TIMESTAMP" &>> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing MYSQL" 

yum install git -y &>> $LOGFILE

VALIDATE $? "installing GIT"
