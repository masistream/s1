FROM tiangolo/nginx-rtmp

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 1935 8080

ENTRYPOINT ["/start.sh"]
