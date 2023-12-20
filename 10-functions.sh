!/bin/bash

ID=$(id -u)

if [$? -ne 0]
VALIDATE(){
then
    echo "ERROR:: installing  is failed"
else
    echo "Installing   is success"
fi  
}

if [$ID -ne 0]
then
    echo "Error:: please run this script with root access"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE