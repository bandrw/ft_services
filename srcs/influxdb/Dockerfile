FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add influxdb

COPY srcs /var/srcs

EXPOSE 8086

CMD ["sh", "/var/srcs/run.sh"]
