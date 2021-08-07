#!usr/bin/bash

read -p "Please enter the username to be added" username

sudo adduser $username

status=$?

if test $status -eq 0 ; then
	echo "user created successfully"
elif test $status -eq 1 ; then
	echo "user already exists"
else 
	echo "Error"
fi 