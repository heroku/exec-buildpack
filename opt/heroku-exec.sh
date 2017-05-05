#!/usr/bin/env bash

if [ -n "$HEROKU_EXEC_URL" ]; then
  [ -z "$SSH_CLIENT" ] && source <(curl --retry 3 -sSL $HEROKU_EXEC_URL)
fi
