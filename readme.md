For *nix systems run `start.sh` and make sure that variable *HOST_NAME* in `.env` points to the right hostname (your dns name or ip address).

### Installation
1. `git clone https://github.com/envy124/CossacksGameServer; cd CossacksGameServer
2. `echo "HOST_NAME=YOUR_HOSTNAME" > .env`
3. `echo "UID=$(id -u)" >> .env; echo "GID=$(id -g)" >> .env`

### Run server
Use `./start.sh` to run server

### TODO
* fix volumes
* make start.bat for windows