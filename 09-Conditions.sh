#!/bin/bash

Number=$1

# -lt means less than
# -eq means equal to
# -ne means not equal to
# -gt means greater than

if [ $Number -gt 10 ]
then
    echo "Given $Number is greater than 10"
else
    echo "Given $Number is not greater than 10"
fi