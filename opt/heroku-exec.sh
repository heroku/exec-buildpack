#!/usr/bin/env bash

if [ -n "$HEROKU_EXEC_URL" ]; then
  [ -z "$SSH_CLIENT" ] && curl -sSL $HEROKU_EXEC_URL | bash
fi
