FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add influxdb supervisor

COPY srcs /var/srcs

# Telegraf
RUN wget http://dl-cdn.alpinelinux.org/alpine/v3.13/community/x86_64/telegraf-1.17.0-r0.apk
RUN apk add telegraf-1.17.0-r0.apk
RUN rm -f telegraf-1.17.0-r0.apk
RUN mv /var/srcs/telegraf.conf /etc/telegraf.conf

RUN mv /var/srcs/supervisor.conf /etc/supervisord.conf

EXPOSE 8086

CMD ["sh", "/var/srcs/run.sh"]
