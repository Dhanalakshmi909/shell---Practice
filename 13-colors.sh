#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
 echo -e "$R ERROR: Please run this script with root access $N"
 exit 1 #given other than 0 upto 127
 else
  echo "you are running with root access"
fi

dnf list installed mysql

VALIDATE(){
 if [ $1 -eq 0 ]
 then 
  echo -e "Installing $2 is ......$G success $N"
else
 echo -e "Installing $2 is ......$R Failure $N"
 #exit 1
fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
echo "mysql is not installed going to install it"
 dnf install mysql
 VALIDATE $? "MySQL"
else 
 echo -e "Nothing to do MYSQL ...$Y Already Installed $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
echo -e "python3 is not installed going to install it"
 dnf install python3
 VALIDATE $? "python3"
else 
 echo -e " Nothing to do  python3 .....$Y Already Installed $N"
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
echo -e "nginx is not installed going to install it"
 dnf install nginx
 VALIDATE $? "nginx"
else 
 echo -e "Nothing to do nginx.....$Y Already Installed $N"
fi
 
