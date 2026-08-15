#!/bin/sh

echo "New stream connected on path: $MTX_PATH. Starting multi-relay..."

TARGETS=""

if [ -n "$YOUTUBE_URL" ]; then
    TARGETS="${TARGETS}|[f=flv]$YOUTUBE_URL"
fi

if [ -n "$TWITCH_URL" ]; then
    TARGETS="${TARGETS}|[f=flv]$TWITCH_URL"
fi

if [ -n "$KICK_URL" ]; then
    TARGETS="${TARGETS}|[f=flv]$KICK_URL"
fi

# Remove leading pipe
TARGETS=$(echo "$TARGETS" | sed 's/^|//')

if [ -z "$TARGETS" ]; then
    echo "No relay targets specified. Exiting..."
    exit 0
fi

echo "Relaying to destinations..."
exec ffmpeg -hide_banner -loglevel info \
  -i "rtmp://127.0.0.1:1935/$MTX_PATH" \
  -c copy \
  -f tee "$TARGETS"
