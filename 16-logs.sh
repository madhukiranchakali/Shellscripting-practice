#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="var/log/Shellscripting-practice"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" 


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

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ] ; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL already exit....$Y SKIPPING $N"
fi  

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ] ; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist......$Y SKIPPING $N"
fi 

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ] ; then 
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "Python3"
else
    echo -e "python3 already exit.....$Y SKIPPING $N"
fi           