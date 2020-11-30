#!/bin/bash

if [[ $PAM_TYPE != "open_session" ]] || [[ $PAM_RHOST == 192.168.* ]]; then
  exit
fi

TOKEN_PATH=/root/.pushbullet-token
TOKEN=$(cat $TOKEN_PATH)

curl -H "Access-Token: $TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{ \"type\": \"note\", \"title\": \"SSH Login\", \"body\": \"User ${PAM_USER} just logged in ${HOSTNAME} from ${PAM_RHOST}\" }" \
  -X POST https://api.pushbullet.com/v2/pushes
