FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add nginx \
			supervisor \
			php7 php7-fpm php7-mysqli php7-iconv php7-json php7-session php7-mbstring

COPY srcs /var/srcs

RUN rm -rf /var/www/localhost

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip
RUN unzip -q phpMyAdmin-5.0.4-all-languages.zip
RUN rm -f phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin
RUN mkdir -p /var/www/phpmyadmin/tmp && chmod 777 /var/www/phpmyadmin/tmp
RUN mv /var/srcs/config.inc.php /var/www/phpmyadmin
RUN mv /var/srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN mv /var/srcs/supervisor.conf /etc/supervisord.conf

RUN mkdir /run/nginx

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
