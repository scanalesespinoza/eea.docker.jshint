#!/bin/sh
set -e

CMD="jshint"

if [[ ${CMD:0:4} = "http" ]]; then
  GIT_SRC=$@
  CMD="jshint"
fi

if [[ ${CMD:0:3} = "git" ]]; then
  GIT_SRC=$@
  CMD="jshint"
fi

if [ ! -z "$GIT_SRC" ]; then
  cd /tmp
  git clone $GIT_SRC
  if [ ! -z "$GIT_NAME" ]; then
     if [ -z "$GIT_BRANCH" ]; then
       GIT_BRANCH="master"
     fi
     cd $GIT_NAME
     if [ ! -z "$GIT_CHANGE_ID" ]; then
        GIT_BRANCH=PR-${GIT_CHANGE_ID}
        git fetch origin pull/$GIT_CHANGE_ID/head:$GIT_BRANCH
     fi
     git checkout $GIT_BRANCH
     cd /tmp
  fi
fi

if [[ ${CMD:0:1} = "-" ]]; then
  exec jshint "$@"
fi

if [ -z "$PARAMS" ]; then
  PARAMS="--exclude **/_static/*.js"
fi

if [ "$CMD" = "jshint" ]; then
  jshint $PARAMS "/tmp/$GIT_NAME" & PID=$!
  echo "GIT NAME ES: $GIT_NAME  + exit code: $? + PID: $PID"
  ls -la "/tmp/$GIT_NAME"
  ps aux
else
  exec "$@"
fi
kill -s SIGINT $PID
