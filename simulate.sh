#! /bin/sh

# Stop the updates after this number of iterations is provided.
stop_after=${1:-0}
port=${2:-5984}

while true; do
	sleep 0.5

	# Post some random data!
	len=$((RANDOM % 511 + 1))
	data=$(head -c$len  /dev/urandom | base64)
	json="{ \"data\": \"${data}\", \"len\": $len }"
	curl -X POST http://localhost:${port}/polling/ -H "Content-Type: application/json" -d "$json"

	if [ $stop_after -gt 0 ]; then
		stop_after=$(expr $stop_after - 1)
		if [ $stop_after -eq 0 ]; then
			break
		fi
	fi
done