#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR="/home/ec2-user/app-logs"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then
    echo -e "$R ERR :: $N PLEASE RUN WITH ROOT ACCESS" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$R PROCEED :: $N YOU ARE RUNNING WITH ROOT ACCESS" | tee -a $LOG_FILE
fi

VERIFY(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is .. $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is .. $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
}

echo "Script started executing at : $(date)"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r filepath
do 
    echo "Deleting file : $filepath" | tee -a $LOG_FILE
    rm -rf $filepath
done <<< $FILES_TO_DELETE

echo "Script executed successfully"