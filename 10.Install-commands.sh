#!/bin/bash

USERID=$(id -u)

#check user has root privileges or not
if [ $USERID -ne 0 ]
then
    echo "ERR :: Please run this script with root access"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

dnf list installed nginx
#check if it's already installed $? is 0, then if not installed $? not 0 then expression is true
if [ $? -ne 0 ]
then 
    echo "nginx is not installed ... Going to install it"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "Installing nginx is ... SUCCESS"
    else
        echo "Installing nginx is ... FAILURE"
        exit 1 #give other than 0 upto 127
    fi
else
    echo "nginx is already installed ... Nothing to do"
fi