#!/bin/bash
cd ./$scs

# create log dir and log files
mkdir logs
touch logs/access.log logs/error.log

# set cossacks configuration
sed -i -E "s/chat_server   = .*/chat_server   = $HOST_NAME/" etc/simple-cossacks-server.conf
sed -i -E "s/hole_int      = 300/hole_int      = $UDP_KEEP_ALIVE_INTERVAL/" etc/simple-cossacks-server.conf
sed -i -E "s|access_log    = ./logs/access_log|access_log    = ./logs/access.log|" etc/simple-cossacks-server.conf
sed -i -E "s|error_log     = ./logs/error_log|error_log     = ./logs/error.log|" etc/simple-cossacks-server.conf
perl -mlib=lib script/simple-cossacks-server -c etc/simple-cossacks-server.conf
