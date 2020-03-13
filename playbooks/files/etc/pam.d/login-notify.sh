#!/bin/bash

if [[ $PAM_TYPE != "open_session" ]] || [[ $PAM_RHOST == 192.168.* ]]; then
  exit
fi

source /root/.pushbullet-token

curl -H "Access-Token: $TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{ \"type\": \"note\", \"title\": \"SSH Login\", \"body\": \"User ${PAM_USER} just logged in ${HOSTNAME} from ${PAM_RHOST}\" }" \
  -X POST https://api.pushbullet.com/v2/pushes
