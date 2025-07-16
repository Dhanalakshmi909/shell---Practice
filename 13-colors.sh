#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
 
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo$0|cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at : $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
 echo -e "$R ERROR: Please run this script with root access $N"  &>>$LOG_FILE
 exit 1 #given other than 0 upto 127
 else
  echo "you are running with root access"  &>>$LOG_FILE
fi

dnf list installed mysql  &>>$LOG_FILE

VALIDATE(){
 if [ $1 -eq 0 ]
 then 
  echo -e "Installing $2 is ......$G success $N"  &>>$LOG_FILE
else
 echo -e "Installing $2 is ......$R Failure $N"  &>>$LOG_FILE
 #exit 1
fi
}
dnf list installed mysql  &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo "mysql is not installed going to install it"  &>>$LOG_FILE
 dnf install mysql  &>>$LOG_FILE
 VALIDATE $? "MySQL"
else 
 echo -e "Nothing to do MYSQL....$Y Already Installed $N"  &>>$LOG_FILE
fi

dnf list installed python3  &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo -e "python3 is not installed going to install it"  &>>$LOG_FILE
 dnf install python3  &>>$LOG_FILE
 VALIDATE $? "python3"
else 
 echo -e " Nothing to do  python3 .....$Y Already Installed $N" &>>$LOG_FILE
fi
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo -e "nginx is not installed going to install it" &>>$LOG_FILE
 dnf install nginx &>>$LOG_FILE
 VALIDATE $? "nginx"
else 
 echo -e "Nothing to do nginx.....$Y Already Installed $N" &>>$LOG_FILE
fi
 
