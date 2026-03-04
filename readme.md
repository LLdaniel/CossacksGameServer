For *nix systems run `start.sh` and make sure that variable *HOST_NAME* in `.env` points to the right hostname (your dns name or ip address).

### Installation
1. Clone the repository with `git clone` and change into the server directory `cd CossacksGameServer`
2. Create an environment file with the following properties:
```
cat <<EOF > .env
# your server's hostname
HOST_NAME=<your hostname>

# keep alive interval udp
UDP_KEEP_ALIVE_INTERVAL=<your interval>

# user and group id for volume permission
UID=$(id -u)
GID=$(id -g)
EOF
```

### Run server
Use `./start.sh` to run server

### Tested Client and Server Combination
This server is tested with the client version 1.42 from [ereb-thanatos/cossacks-revamp-2017](https://github.com/ereb-thanatos/cossacks-revamp-2017).
It contains the GSC version and after replacing `play.cossacks-server.net` with the server domain in `internet/ggwdc.ini`, the connection to the server will be possible:
```ini
#################################################################
# This is configuration file for GSC Game World client software #
#################################################################
# Address of the GGW server
ggwdserver_addr play.cossacks-server.net
# Port of the GGW server
ggwdserver_port 34001
# Language/Locale to communicate with GGW server
ggwdserver_lang 0
# Protocol/Game version to communicate with GGW server
ggwdserver_vers 2
```
