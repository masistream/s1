#!/bin/sh

echo "New stream arrived on path: $MTX_PATH. Launching relays..."

relay_stream() {
  target_name="$1"
  target_url="$2"

  if [ -z "$target_url" ]; then
    echo "[$target_name] URL not set, skipping."
    return 0
  fi

  echo "[$target_name] Relaying stream..."
  ffmpeg -hide_banner -loglevel warning \
    -i "rtmp://127.0.0.1:1935/$MTX_PATH" \
    -c copy \
    -f flv "$target_url" &
}

relay_stream "YouTube" "$YOUTUBE_URL"
relay_stream "Twitch" "$TWITCH_URL"
relay_stream "Kick" "$KICK_URL"

wait
