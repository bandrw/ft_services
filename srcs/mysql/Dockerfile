FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add openrc mysql mysql-client

RUN mkdir /var/srcs
COPY srcs/* /var/srcs/

RUN openrc default
RUN /etc/init.d/mariadb setup
# RUN /etc/init.d/mariadb start
# RUN echo "CREATE DATABASE wordpress;" | mysql
# RUN /etc/init.d/mariadb stop

EXPOSE 3306

CMD sh /var/srcs/run.sh
