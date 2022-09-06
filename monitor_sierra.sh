#!/usr/bin/env bash

accesstoken=$(curl -s -k -X 'POST' \
  'https://192.168.1.1/api/v1/auth/tokens' \
  -H 'accept: application/vnd.api+json' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
  "login": "logger",
  "password": "<password>"
}' | jq -r .data.access_token)

curl -s -k -X 'POST' \
  'https://192.168.1.1/api/v1/register/db?fetch=true' \
  -H 'accept: application/vnd.api+json' \
  -H "Authorization: Bearer $accesstoken" \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
  "last": [
    "services.web.session.timeout", "net.interface.cellular[]" ,"location.gnss.latitude","location.gnss.longitude","net.interface.cellattribute[]"
  ]
}'

curl -s -k -X 'POST' \
  'https://192.168.1.1/api/v1/register/logs/regular' \
  -H 'accept: */*' \
  -H "Authorization: Bearer $accesstoken" \
  -d ''


echo

while true ; do

curl -s -k -X "GET" \
  "https://192.168.1.1/api/v1/events?timeout=35" \
  -H "accept: application/vnd.api+json" \
  -H "Authorization: Bearer $accesstoken" | jq
echo
done
