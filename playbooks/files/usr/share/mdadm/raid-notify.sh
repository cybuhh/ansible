#!/bin/bash

TOKEN_PATH=/root/.pushbullet-token
TOKEN=$(cat $TOKEN_PATH)

curl -H "Access-Token: $TOKEN" \
     -H 'Content-Type: application/json' \
     -d "{ \"type\": \"note\", \"title\": \"RAID status@$HOSTNAME\", \"body\": \"$1\" }" \
     -X POST https://api.pushbullet.com/v2/pushes
