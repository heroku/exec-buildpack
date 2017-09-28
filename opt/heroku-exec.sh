#!/usr/bin/env bash

if [[ "${DYNO}" = run\.* ]]; then
  if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
    source <(curl --fail -sSL "$HEROKU_EXEC_URL")
  fi
fi
