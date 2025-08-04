#!/bin/sh

if [ -z "$NGROK_AUTH_TOKEN" ]; then
  echo "Error: NGROK_AUTH_TOKEN is not set."
  exit 1
fi

ngrok config add-authtoken "$NGROK_AUTH_TOKEN"
ngrok http 8000 --log=stdout &
uvicorn api:app --host 0.0.0.0 --port 8000
