#! /bin/sh

# Set the timeout to 10000ms to kill the connection after no changes come in
# http://wiki.apache.org/couchdb/HTTP_database_API#Changes
curl "http://localhost:5984/polling/_changes?feed=continuous&timeout=10000"
