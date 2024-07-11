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

### TODO
* make start.bat for windows
