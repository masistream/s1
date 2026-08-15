FROM bluenviron/mediamtx:latest-ffmpeg

COPY mediamtx.yml /mediamtx.yml
COPY start.sh /start.sh
COPY relay.sh /relay.sh

RUN sed -i 's/\r$//' /start.sh /relay.sh /mediamtx.yml && chmod +x /start.sh /relay.sh

EXPOSE 1935 8080

ENTRYPOINT ["/start.sh"]
