#!/bin/bash

# Clone files
git clone https://github.com/Soneium/soneium-node.git

cd soneium-node/minato || exit

# Generate jwt.txt
openssl rand -hex 32 > jwt.txt

# Rename sample.env
cp sample.env .env

# Backup original files
mkdir -p org-file
mv sample.env org-file/sample.env
cp minato-genesis.json org-file/org-minato-genesis.json
cp docker-compose.yml org-file/org-docker-compose.yml
cp minato-rollup.json org-file/org-minato-rollup.json
