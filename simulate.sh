#! /bin/sh
while true; do
	sleep 0.5

	# Post some random data!
	len=$((RANDOM % 511 + 1))
	data=$(head -c$len  /dev/urandom | base64)
	json="{ \"data\": \"${data}\", \"len\": $len }"
	curl -X POST http://localhost:5984/polling/ -H "Content-Type: application/json" -d "$json"
done