#!/usr/bin/env bash

if [ -n "$TUNNELS_URL" ]
  [ -z "$SSH_CLIENT" ] && curl -sSL $TUNNELS_URL | bash
fi
