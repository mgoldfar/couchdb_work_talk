#! /bin/sh
srcport=${1:-5984}
destport=${2:-5985}
maxlen=${3:-128}

# Continous filtered replication - create target will make a DB is none exists
json="{\"source\":\"http://localhost:${srcport}/polling\""
json="${json}, \"target\":\"http://localhost:${destport}/polling\""
json="${json}, \"filter\":\"filters/max_len\", \"query_params\": {\"max_len\":\"$maxlen\"}"
json="${json}, \"continuous\": true, \"create_target\": true }"
curl -X POST http://localhost:${srcport}/_replicate/ -H "Content-Type: application/json" -d "$json"
