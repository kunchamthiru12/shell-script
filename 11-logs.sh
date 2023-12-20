!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%s)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [$1? -ne 0]
    then
        echo "ERROR:: $2 ...   failed"
        exit1
    else
        echo "$2 .... success"
    fi  
}

if [$ID -ne 0]
then
    echo "Error:: please run this script with root access"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y &>> $LOGFIE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"