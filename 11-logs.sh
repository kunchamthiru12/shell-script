!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%s)
R="\e[31m"
G="\e[32m"
n="\e[0m"
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Error:: please run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y &>> $LOGFIE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"