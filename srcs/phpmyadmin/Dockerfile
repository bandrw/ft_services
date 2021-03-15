FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add openrc nginx supervisor php7 php7-fpm php7-mysqli

COPY srcs /var/srcs

RUN openrc && openrc default && touch /run/openrc/softlevel

RUN rm -rf /var/www/localhost

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip
RUN unzip -q phpMyAdmin-5.0.4-all-languages.zip
RUN rm -f phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages /usr/share/phpmyadmin
RUN ln -s /usr/share/phpmyadmin /var/www/
RUN mv /var/srcs/config /etc/nginx/conf.d/default.conf
RUN mv /var/srcs/supervisor.conf /etc/supervisord.conf

RUN mkdir /run/nginx

EXPOSE 5000

# CMD sh /var/srcs/run.sh
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
