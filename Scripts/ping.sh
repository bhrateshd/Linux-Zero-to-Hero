#!/bin/bash

FILE='servers.txt'

while read server
do 
	ping -c 3 $server > /dev/null
	if [ $? -eq 0 ]
	then
		echo "$server is UP"
	else
		echo "$server is DOWN"
	fi
done < $FILE
