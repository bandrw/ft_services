FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add nginx openssl supervisor

RUN rm -rf /var/www/localhost

COPY srcs /var/srcs

RUN cp /var/srcs/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21 School/OU=Student/CN=kfriese" -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
RUN mkdir /run/nginx
RUN cp -r /var/srcs/test_webpage/* /var/www/

# Telegraf
RUN wget http://dl-cdn.alpinelinux.org/alpine/v3.13/community/x86_64/telegraf-1.17.0-r0.apk
RUN apk add telegraf-1.17.0-r0.apk
RUN rm -f telegraf-1.17.0-r0.apk
RUN mv /var/srcs/telegraf.conf /etc/telegraf.conf

RUN mv /var/srcs/supervisor.conf /etc/supervisord.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
