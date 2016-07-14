#!/bin/sh
trap 'kill $(jobs -pr)' SIGINT SIGTERM EXIT
for i in $(seq 1 ${1:-1}); do
	port=$(expr $i + 5983)
	configdir=./configs/instance${i}
	config=${configdir}/config.ini
	if [ ! -d ${configdir} ]; then
		mkdir -p ${configdir}
		echo "[couchdb]" > $config
		echo "database_dir   = ./instance${i}/db" >> $config
		echo "view_index_dir = ./instance${i}/view" >> $config
		echo "uri_file       = ./instance${i}/couch.uri" >> $config
		echo "[log]" >> $config
		echo "file = ./instance${i}/couch.log" >> $config
		echo "[httpd]" >> $config
		echo "port = $port" >> $config
	fi
	
	echo "Launching instance $i on port $port"
	couchdb -A ${configdir} -p ${i}.pid &
done
wait