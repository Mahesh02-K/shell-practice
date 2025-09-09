#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

#check root previliges
if [ $USERID -ne 0 ]
then
    echo -e "$R ERR :: Please run this script with root access $N"
    exit 1 #give other than 0 upto 127
else
    echo -e "$G You are running with root access $N"
fi

#Verify function takes input as exit status and what command we tried to install
VERIFY(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N"
    else
        echo -e "Installing $2 is ... $R FAILURE $N"
        exit 1 #give other than 0 upto 127
    fi
}

dnf list installed mysql 
if [ $? -ne 0 ]
then
    echo -e "$R MySQL is not installed $N ... Going to install it"
    dnf install mysql -y
    VERIFY $? mysql
else
    echo -e "$Y MySQL is already installed $N ... Nothing to do"
fi

dnf list installed nginx 
if [ $? -ne 0 ]
then
    echo -e "$R Nginx is not installed $N ... Going to install it"
    dnf install nginx -y
    VERIFY $? nginx
else
    echo -e "$Y Nginx is already installed $N ... Nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "$R Python3 is not installed $N ... Going to install it"
    dnf install python3 -y
    VERIFY $? python3
else
    echo -e "$Y Python3 is already installed $N ... Nothing to do"
fi

