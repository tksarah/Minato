#!/bin/bash

# Load Environment Variables
if [ -f .env ]; then
  export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

echo
echo "======================================="
echo "Status container:"
echo 
docker container ls --format "table {{.Names}}\t{{.Status}}"
echo "======================================="

echo 

echo "======================================="
echo "block-number:"
echo 
cast block-number --rpc-url http://$P2P_ADVERTISE_IP:8545
echo "======================================="
echo
