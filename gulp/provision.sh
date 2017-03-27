#!/usr/bin/env bash

if ! $(gulp -v); then
  echo "installing gulp globally..."
  npm install -g gulp
fi
