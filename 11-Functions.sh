#!/bin/bash

USERID=$(ID -u)

if [ $USERID -ne 0 ]
then
 echo "ERROR: Please run this script with root access"
 exit 1 #given other than 0 upto 127
 else
  echo "you are running with root access"
fi

dnf list installed mysql

VALIDATE(){
 if [ $1 -eq 0 ]
 then 
  echo "Installing $2 is ........success"
else
 echo "Installing $2 is .........Failure"
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
 echo "MySQL already installed..... nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
echo "python3 is not installed going to install it"
 dnf install python3
 VALIDATE $? "python3"
else 
 echo "python3 already installed..... nothing to do"
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
echo "nginx is not installed going to install it"
 dnf install nginx
 VALIDATE $? "nginx"
else 
 echo "nginx already installed..... nothing to do"
fi