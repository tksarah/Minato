#!/bin/bash

PUBIP=""
PORT=8545

echo "=== blockNumber: ==="
curl -i -X POST \
  --data '{"id": 1, "jsonrpc": "2.0", "method": "eth_blockNumber"}' \
  -H "Content-Type: application/json" \
  "$PUBIP:$PORT"
echo

echo "=== chainId: === "
curl -i -X POST \
  --data '{"id": 1, "jsonrpc": "2.0", "method": "eth_chainId", "params": []}' \
  -H "Content-Type: application/json" \
  "$PUBIP:$PORT"
echo

echo "=== getBlockByNumber: === "
curl -i -X POST \
  --data '{"id": 1, "jsonrpc": "2.0", "method": "eth_getBlockByNumber", "params": ["latest", false]}' \
  -H "Content-Type: application/json" \
  "$PUBIP:$PORT"
echo
