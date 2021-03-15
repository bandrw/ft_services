FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add nginx openssl

RUN rm -rf /var/www/localhost

COPY srcs /var/srcs

RUN cp /var/srcs/config /etc/nginx/conf.d/default.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21 School/OU=Student/CN=kfriese" -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
RUN mkdir /run/nginx

EXPOSE 80 443

CMD sh /var/srcs/run_server.sh
