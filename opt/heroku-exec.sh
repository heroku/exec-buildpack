#!/usr/bin/env bash

if [ -n "$HEROKU_PRIVATE_IP" ] || ! [[ "$DYNO" =~ ^(run\..*|release\..*) ]]; then
  if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
    echo "[heroku-exec] Using staging buildpack"
    export HEROKU_EXEC_URL="$(echo "$HEROKU_EXEC_URL" | sed s/exec-manager\.heroku/exec-manager-staging\.herokai/)"
    source <(curl --fail --max-time 5 -sSL "$HEROKU_EXEC_URL")
  fi
fi
