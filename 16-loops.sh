#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"
LOGS_FOLDER="var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "python3" "httpd")

mkdir -p "$LOGS_FOLDER"
echo "Script started executing at :: $(date)" | tee -a $LOG_FILE

#check root previliges
if [ $USERID -ne 0 ]
then
    echo -e "$R ERR :: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo -e "$G You are running with root access $N" | tee -a $LOG_FILE
fi

#Verify function takes input as exit status and what command we tried to install
VERIFY(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1 #give other than 0 upto 127
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$R $package is not installed $N ... Going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VERIFY $? $package
    else
        echo -e "$Y $package is already installed $N ... Nothing to do" | tee -a $LOG_FILE
    fi
done

# dnf list installed mysql &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$R MySQL is not installed $N ... Going to install it" | tee -a $LOG_FILE
#     dnf install mysql -y &>>$LOG_FILE
#     VERIFY $? mysql
# else
#     echo -e "$Y MySQL is already installed $N ... Nothing to do" | tee -a $LOG_FILE
# fi

# dnf list installed nginx &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$R Nginx is not installed $N ... Going to install it" | tee -a $LOG_FILE
#     dnf install nginx -y &>>$LOG_FILE
#     VERIFY $? nginx
# else
#     echo -e "$Y Nginx is already installed $N ... Nothing to do"| tee -a $LOG_FILE
# fi

# dnf list installed python3 &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$R Python3 is not installed $N ... Going to install it" | tee -a $LOG_FILE
#     dnf install python3 -y &>>$LOG_FILE
#     VERIFY $? python3
# else
#     echo -e "$Y Python3 is already installed $N ... Nothing to do" | tee -a $LOG_FILE
# fi
