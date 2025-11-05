#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privileges"
    exit 1
fi

dnf  install mysql -y

if [$? -ne 0 ]: then
    echo "ERROR:: Installating MySQL is FAILURE"
    exit 1

else 
    echo "Installation MYSQL is SUCCESS"
fi        

