FROM alpine:3.3
MAINTAINER "EEA: IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

ENV JSHINT_VERSION=2.9.1

RUN apk add --no-cache --virtual .run-deps nodejs \
 && npm install -g jshint@$JSHINT_VERSION

ENTRYPOINT ["jshint"]
CMD ["/code"]
