#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "ERROR:: Please run this script with root access"
   exit 1 #give other than 0 upto 127
else
   echo "you are running with root access"
 
fi

dnf list installed mysql
# check already install or not, If installed $? is 0 then
#If not installed $? is not 0 expression is true
if [ $? -ne 0 ]
then
  echo "mysql is not installed..going to be installed"
  dnf install mysql -y
if [ $? -eq 0 ]
then
  echo "Install the mysql is ...success"
else
  echo "Install the mysql is ...failure"
  exit 1
fi
else
 echo "mysql already installed...Nothing to do"
 fi
  
 