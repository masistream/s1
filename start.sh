#!/bin/sh

YOUTUBE_PUSH=""
TWITCH_PUSH=""
KICK_PUSH=""

fix_url() {
    echo "$1" | sed 's/rtmps:\/\//rtmp:\/\//g'
}

if [ -n "$YOUTUBE_URL" ]; then
    CLEAN_URL=$(fix_url "$YOUTUBE_URL")
    echo "[Relay] YouTube Push enabled: $CLEAN_URL"
    YOUTUBE_PUSH="push $CLEAN_URL;"
fi

if [ -n "$TWITCH_URL" ]; then
    CLEAN_URL=$(fix_url "$TWITCH_URL")
    echo "[Relay] Twitch Push enabled: $CLEAN_URL"
    TWITCH_PUSH="push $CLEAN_URL;"
fi

if [ -n "$KICK_URL" ]; then
    CLEAN_URL=$(fix_url "$KICK_URL")
    echo "[Relay] Kick Push enabled: $CLEAN_URL"
    KICK_PUSH="push $KICK_URL;"
fi

sed -e "s|__PUSH_YOUTUBE__|$YOUTUBE_PUSH|g" \
    -e "s|__PUSH_TWITCH__|$TWITCH_PUSH|g" \
    -e "s|__PUSH_KICK__|$KICK_PUSH|g" \
    /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "Starting Nginx RTMP Server..."
exec nginx -g "daemon off;"
