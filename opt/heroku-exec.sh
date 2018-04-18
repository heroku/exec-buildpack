#!/usr/bin/env bash

if [ -n "$HEROKU_PRIVATE_IP" ] || [[ "$DYNO" != run\.* ]]; then
  if [ -n "$HEROKU_EXEC_URL" ] && [ -z "$SSH_CLIENT" ]; then
    echo "[heroku-exec] Using staging buildpack"
    export HEROKU_EXEC_URL="$(echo "$HEROKU_EXEC_URL" | sed s/exec-manager\.heroku/exec-manager-staging\.herokai/)"
    sshd_pid="$(ps -C sshd -o pid=)"
    ssh_pid="$(ps -C ssh -o pid=)"
    [ -n "$sshd_pid" ] && kill -9 "$sshd_pid"
    [ -n "$ssh_pid" ] && kill -9 "$ssh_pid"
    source <(curl --fail --max-time 5 -sSL "$HEROKU_EXEC_URL")
  fi
fi
