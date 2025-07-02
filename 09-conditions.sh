#!/bin/bash

Number=$1

if [ $Number -lt 10 ]
then
  echo "Given number $Number is lessthan 10"
else
 echo "Given number $Number is not lessthan 10"
fi


# NUMBER=$1

# # -gt --> greater than
# # -lt --> less than
# # -eq --> equal
# # -ne --> not equal

# if [ $NUMBER -lt 10 ]
# then
#     echo "Given number $NUMBER is less than 10"
# else
#     echo "Given number $NUMBER is not less than 10"
# fi