#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

    if [ $USERID -ne 0 ]; then
        echo "ERROR:: Please run this script with root privilege"
        exit 1
    fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2.....$R FAILURE $N"
        exit 1
    else
        echo -e "Installating $2.....$G SUCCESS $N"
    fi
}

dnf list installed mysql
    if [ $? -ne 0 ] ; then
        dnf install mysql -y
        VALIDATE $? "MYSQL"
    else
        echo -e "MYSQL already exit....$Y SKIPPING $N"
    fi
dnf list installed nginx
    if [ $? -ne 0 ] ; then
        dnf install nginx -y
        VALIDATE $? "Nginx"
    else
        echo -e "Nginx already exist......$Y SKIPPING $N"
    fi
dnf list installed python3
    if [ $? -ne 0 ] ; then 
        dnf install python3 -y
        VALIDATE $? "Python3"
    else
        echo -e "python3 already exit.....$Y SKIPPING $N"
    fi                    