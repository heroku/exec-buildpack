#!/usr/bin/env bash

if [ -n "$HEROKU_PRIVATE_IP" ] || [[ "$DYNO" != run\.* ]]; then
  if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
    source <(curl --fail --max-time 5 -sSL "$HEROKU_EXEC_URL")
  fi
fi
