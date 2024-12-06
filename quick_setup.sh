#!/bin/bash

### Setup OS
apt-get update
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
docker compose version

### Building minato
mkdir build

# Generate jwt.txt
openssl rand -hex 32 > ./build/jwt.txt

# Rename sample.env
cp ./files-startale/sample2.env ./build/.env

# Copy other files
cp ./files-startale/minato-genesis.json ./build/
cp ./files-startale/minato-rollup.json ./build/
cp ./files-startale/docker-compose.yml ./build/

## Replace public ip address
IP_FILE="pub_ip"
PUB_IP=$(cat $IP_FILE)

# for .env
TARGET_FILE_ENV="build/.env"
sed -i "s/^P2P_ADVERTISE_IP=.*/P2P_ADVERTISE_IP=$PUB_IP/" $TARGET_FILE_ENV

# for docker-compose.yml
TARGET_FILE_DOCKER="build/docker-compose.yml"
sed -i "s/--nat=extip:<your_node_public_ip>/--nat=extip:$PUB_IP/" $TARGET_FILE_DOCKER

### Setup check tool
# Install foundryup
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc
export PATH=$HOME/.foundry/bin:$PATH
foundryup

# Copy check script
cp ./snippet/progress.sh ./build/
