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
  if [ ! -z "$GIT_NAME" ]; then
     if [ -z "$GIT_BRANCH" ]; then
       GIT_BRANCH="master"
     fi
     cd $GIT_NAME
     if [ ! -z "$GIT_CHANGE_ID" ]; then
        git fetch origin pull/$GIT_CHANGE_ID/head:$GIT_BRANCH
     fi
     git checkout $GIT_BRANCH
     cd /code
  fi
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
