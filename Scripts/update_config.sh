#!/bin/bash


SERVERS="servers.txt"

FILE="/opt/app/config.properties"
NEW_IP="10.0.0.5"
NEW_PORT="9090"

for SERVER in $(cat $SERVERS)
do 
	echo "Updating config on $SERVER ..."
	ssh user@$SERVER << EOF
	sed -i "s/server_ip=.*/server_ip=$NEW_IP/" $FILE
	sed -i "s/server_port=.*/server_port=$NEW_PORT" $FILE
EOF

echo "Update is Completed on $SERVER"

done
