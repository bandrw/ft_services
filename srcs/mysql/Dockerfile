FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add openrc mysql mysql-client

COPY srcs /var/srcs

RUN openrc && openrc default && touch /run/openrc/softlevel

RUN mv /var/srcs/mysql.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD sh /var/srcs/run.sh
