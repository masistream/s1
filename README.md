# Stream Relay for Railway

Multi-streaming RTMP Relay server using MediaMTX and FFmpeg.

## Variables (Railway)
Set environment variables in Railway:

- `YOUTUBE_URL`: `rtmps://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY`
- `TWITCH_URL`: `rtmp://live.twitch.tv/app/YOUR_STREAM_KEY`
- `KICK_URL`: `rtmp://fa723fc1b071.global-contribute.live-video.net/app/YOUR_STREAM_KEY`

## OBS Setup
1. Enable TCP Proxy on Railway for port `1935`.
2. OBS Stream Server: `rtmp://<RAILWAY_TCP_PROXY_DOMAIN>:<PORT>/live`
3. Stream Key: optional / any text (e.g. `stream`)
