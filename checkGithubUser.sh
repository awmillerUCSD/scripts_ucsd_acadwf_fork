#!/bin/bash

# Author: Arden Liao

# Check to make sure student submitted github id is valid
# echo's to console and a file if their id can't be found

echo -n "Oauth token: "
read -s oauth
echo

while read line; do
    check=`echo ${line} | awk -F',' '{print $4}'`
    response=`curl -u ${oauth}:x-oauth-basic https://api.github.com/users/${check} 2>&1`
    checkResp=`echo ${response} | grep "Not Found"`
    if [ ! -z "${checkResp}" ]; then
         echo "${line}" | tee -a badIds
    fi 

done < students_list.csv
