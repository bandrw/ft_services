FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

RUN apk add vsftpd openssl

COPY srcs /var/srcs

RUN mv /var/srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21 School/OU=Student/CN=kfriese" -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt
RUN echo "root:root" | chpasswd

EXPOSE 20 21 21000

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
