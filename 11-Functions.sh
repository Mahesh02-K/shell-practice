#!/bin/bash

USERID=$(id -u)

#check root previliges
if [ $USERID -ne 0 ]
then
    echo "ERR :: Please run this script with root access"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

#Verify function takes input as exit status and what command we tried to install
VERIFY(){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is ... SUCCESS"
    else
        echo "Installing $2 is ... FAILURE"
        exit 1 #give other than 0 upto 127
    fi
}

dnf list installed mysql 
if [ $? -ne 0 ]
then
    echo "MySQL is not installed ... Going to install it"
    dnf install mysql -y
    VERIFY $? mysql
else
    echo "MySQL is already installed ... Nothing to do"
fi

dnf list installed nginx 
if [ $? -ne 0 ]
then
    echo "Nginx is not installed ... Going to install it"
    dnf install nginx -y
    VERIFY $? nginx
else
    echo "Nginx is already installed ... Nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "Python3 is not installed ... Going to install it"
    dnf install python3 -y
    VERIFY $? python3
else
    echo "Python3 is already installed ... Nothing to do"
fi

