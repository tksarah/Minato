#!/bin/bash

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
# Set your pub ip address
cast block-number --rpc-url http://<your pub ip>:8545
echo "======================================="
echo
