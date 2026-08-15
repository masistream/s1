FROM bluenviron/mediamtx:latest-ffmpeg
COPY mediamtx.yml /mediamtx.yml
COPY start.sh /start.sh
RUN sed -i 's/\r$//' /start.sh /mediamtx.yml && chmod +x /start.sh
EXPOSE 1935 8080
ENTRYPOINT ["/start.sh"]
