# This is a image of cossacks stun server
FROM alpine:latest

ENV rootpath /app

RUN apk update && \
    apk add python3 py3-redis

ADD target/ $rootpath/

WORKDIR $rootpath

ENTRYPOINT ["./entrypoint.sh"]