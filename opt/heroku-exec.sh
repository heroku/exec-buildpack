#!/usr/bin/env bash

if [ -n "$HEROKU_PRIVATE_IP" ] || [[ "$DYNO" != run\.* ]]; then
  if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
    export HEROKU_EXEC_URL="$(echo "$HEROKU_EXEC_URL" | sed s/heroku-exec\.herokuapp/heroku-exec-staging\.herokuapp/)"
    source <(curl --fail --max-time 5 -sSL "$HEROKU_EXEC_URL")
  fi
fi
