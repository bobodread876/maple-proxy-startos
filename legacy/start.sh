#!/bin/bash
set -eu
config=/data/start9/config.yaml
export MAPLE_HOST=0.0.0.0 MAPLE_PORT=8080
export MAPLE_BACKEND_URL
MAPLE_BACKEND_URL=$(yq -er '."backend-url"' "$config")
key=$(yq -r '."api-key" // ""' "$config")

nginx -g 'daemon off;' &
ui=$!
if [[ -n "$key" ]]; then
    export MAPLE_API_KEY="$key" MAPLE_ENABLE_CORS=false
else
    unset MAPLE_API_KEY
    export MAPLE_ENABLE_CORS=true
fi
setpriv --reuid=maple --regid=maple --init-groups /usr/local/bin/maple-proxy &
proxy=$!
trap 'kill -TERM "$ui" "$proxy" 2>/dev/null || true' EXIT
trap 'exit 0' TERM INT
wait -n "$ui" "$proxy"
