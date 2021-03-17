FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add nginx \
			supervisor \
			php7 php7-fpm php7-mysqli php7-json php7-ctype

RUN rm -rf /var/www/localhost

COPY srcs /var/srcs

RUN cp /var/srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar xzf latest-ru_RU.tar.gz
RUN rm -f latest-ru_RU.tar.gz
RUN mv wordpress /var/www/
RUN mv /var/srcs/supervisor.conf /etc/supervisord.conf
RUN mv /var/srcs/wp-config.php /var/www/wordpress/

RUN mkdir /run/nginx /run/php

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
