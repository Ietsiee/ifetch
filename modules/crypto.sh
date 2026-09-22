#!/bin/sh
crypto="${1:-BTC}"
echo "$crypto: \$$(curl -s "https://data-api.binance.vision/api/v3/ticker/price?symbol=${crypto}USDT" | sed 's/.*"price":"\([^"]*\)".*/\1/')"
