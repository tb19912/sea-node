#!/bin/sh
set -e

PORT="${PORT:-10000}"
: "${UUID:?UUID env var is required}"
: "${WS_PATH:?WS_PATH env var is required}"

sed -e "s|__PORT__|${PORT}|g" \
    -e "s|__UUID__|${UUID}|g" \
    -e "s|__WSPATH__|${WS_PATH}|g" \
    /usr/local/share/xray/config.template.json > /tmp/config.json

exec /usr/local/share/xray/xray run -config /tmp/config.json
