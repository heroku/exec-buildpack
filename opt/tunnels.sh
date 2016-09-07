#!/usr/bin/env bash

if [ -n "$TUNNELS_URL" ]; then
  [ -z "$SSH_CLIENT" ] && curl -sSL $TUNNELS_URL | bash
fi
