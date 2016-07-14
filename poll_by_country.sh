#! /bin/sh

# Set the timeout to 10000ms to kill the connection after no changes come in
# http://wiki.apache.org/couchdb/HTTP_database_API#Changes
country=${1:-USA}
curl "http://localhost:5984/music/_changes?feed=continuous&timeout=10000&filter=filters/by_country&country=$country"
