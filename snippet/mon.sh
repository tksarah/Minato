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
cast block-number --rpc-url http://<your pub ip address>:8545
echo "======================================="
echo
