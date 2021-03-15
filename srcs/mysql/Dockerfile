FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add openrc mysql mysql-client

COPY srcs /var/srcs

RUN openrc && openrc default && touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN /etc/init.d/mariadb start && \
	echo "CREATE DATABASE wordpress;" | mysql && \
	/etc/init.d/mariadb stop

EXPOSE 3306

CMD sh /var/srcs/run.sh
