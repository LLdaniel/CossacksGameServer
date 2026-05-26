# This is a image of cossacks game server
# --- Builder ---
FROM debian:stable-slim AS builder

ARG rootpath=/app
ARG streamer=/GSC-Streamer
ARG server=/GSC-Server
ARG scs=/SimpleCossacksServer

RUN apt-get update -q --fix-missing && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends \ 
    build-essential curl perl cpanminus && \
    rm -rf /var/lib/apt/lists/*

ADD target/ $rootpath/

WORKDIR $rootpath

# Install perl modules via cpanm:
RUN cpanm --notest .$streamer/ .$server/ .$scs/ || find /root/.cpanm -name build.log -exec cat {} \;

# --- Runtime ---
FROM debian:stable-slim

EXPOSE 34001

ARG rootpath=/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        perl \
        redis-tools && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/share/perl /usr/local/share/perl
COPY --from=builder /usr/local/lib/x86_64-linux-gnu/perl /usr/local/lib/x86_64-linux-gnu/perl
COPY --from=builder /app /app

WORKDIR /app

CMD ["/app/SimpleCossacksServer/script/simple-cossacks-server", "-c", "/app/SimpleCossacksServer/etc/simple-cossacks-server.conf", "-l", "8"]

