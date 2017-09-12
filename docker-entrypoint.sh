#!/bin/sh
set -e

CMD="$@"

if [[ ${CMD:0:4} = "http" ]]; then
  GIT_SRC=$@
  CMD="jshint"
fi

if [[ ${CMD:0:3} = "git" ]]; then
  GIT_SRC=$@
  CMD="jshint"
fi

if [ ! -z "$GIT_SRC" ]; then
  cd /code
  git clone $GIT_SRC
fi

if [[ ${CMD:0:1} = "-" ]]; then
  exec jshint "$@"
fi

if [ -z "$PARAMS" ]; then
  PARAMS="--exclude **/_static/*.js"
fi

if [ "$CMD" = "jshint" ]; then
  jshint $PARAMS /code
else
  exec "$@"
fi
