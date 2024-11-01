#!/bin/bash

# Load Environment Variables
if [ -f .env ]; then
  export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

cast block-number --rpc-url http://$P2P_ADVERTISE_IP:8545
