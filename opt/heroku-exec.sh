#!/usr/bin/env bash

if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
  source <(curl --fail --retry 3 -sSL "$HEROKU_EXEC_URL")
fi
