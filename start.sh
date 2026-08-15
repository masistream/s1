#!/bin/sh
set -e

echo "Starting MediaMTX..."
mediamtx /mediamtx.yml &
MEDIAMTX_PID=$!
echo "MediaMTX PID: $MEDIAMTX_PID"

relay_stream() {
  target_name="$1"
  target_url="$2"

  if [ -z "$target_url" ]; then
    echo "[$target_name] URL not set, skipping."
    while true; do sleep 3600; done
  fi

  echo "[$target_name] Starting relay loop..."
  while true; do
    ffmpeg -hide_banner -loglevel warning \
      -i "rtmp://127.0.0.1:1935/live" \
      -c copy \
      -f flv "$target_url" || true

    echo "[$target_name] Stream ended or lost. Reconnecting in 5s..."
    sleep 5
  done
}

relay_stream "YouTube" "$YOUTUBE_URL" &
relay_stream "Twitch" "$TWITCH_URL" &
relay_stream "Kick" "$KICK_URL" &

wait $MEDIAMTX_PID
