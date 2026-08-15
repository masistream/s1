#!/bin/sh

YOUTUBE_PUSH=""
TWITCH_PUSH=""
KICK_PUSH=""

if [ -n "$YOUTUBE_URL" ]; then
    echo "[Relay] YouTube Push enabled"
    YOUTUBE_PUSH="push $YOUTUBE_URL;"
fi

if [ -n "$TWITCH_URL" ]; then
    echo "[Relay] Twitch Push enabled"
    TWITCH_PUSH="push $TWITCH_URL;"
fi

if [ -n "$KICK_URL" ]; then
    echo "[Relay] Kick Push enabled"
    KICK_PUSH="push $KICK_URL;"
fi

sed -e "s|__PUSH_YOUTUBE__|$YOUTUBE_PUSH|g" \
    -e "s|__PUSH_TWITCH__|$TWITCH_PUSH|g" \
    -e "s|__PUSH_KICK__|$KICK_PUSH|g" \
    /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "Starting Nginx RTMP Server..."
exec nginx -g "daemon off;"
