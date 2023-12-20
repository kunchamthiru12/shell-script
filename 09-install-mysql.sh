#!/bin/bash

ID=$(id -u)

if [$ID -ne 0]
then
    echo "Error:: please run this script with root access"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y


if [$? -ne 0]
then
    echo "ERROR:: installing MYSQL is failed"
else
    echo "Installing MYSQL  is success"
fi       