#!/bin/sh -x
for i in $(seq 1 ${1:-1}); do
	port=$(expr $i + 5983)
	curl -X DELETE http://localhost:${port}/music
	curl -X PUT http://localhost:${port}/music
	curl -X PUT http://localhost:${port}/music/_design/album --data-binary @music_album_dd.json
	curl -X PUT http://localhost:${port}/music/_design/tags --data-binary @tags_dd.json
	curl -X PUT http://localhost:${port}/music/_design/filters --data-binary @music_changes_dd.json

	curl -X DELETE http://localhost:${port}/polling
	curl -X PUT http://localhost:${port}/polling
	curl -X PUT http://localhost:${port}/polling/_design/filters --data-binary @filtered_replication_dd.json
	curl -X PUT http://localhost:${port}/polling/_design/length --data-binary @polling_len_dd.json
done
