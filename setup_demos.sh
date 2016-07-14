#!/bin/sh -x

curl -X DELETE http://localhost:5984/music
curl -X PUT http://localhost:5984/music
curl -X PUT http://localhost:5984/music/_design/album --data-binary @music_album_dd.json
curl -X PUT http://localhost:5984/music/_design/tags --data-binary @tags_dd.json
curl -X PUT http://localhost:5984/music/_design/filters --data-binary @music_changes_dd.json

curl -X DELETE http://localhost:5984/polling
curl -X PUT http://localhost:5984/polling
