FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

COPY srcs /var/srcs

RUN mv /var/srcs/sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
RUN apk add /var/srcs/glibc-2.33-r0.apk
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.5.linux-amd64.tar.gz
RUN tar xzf grafana-enterprise-7.4.5.linux-amd64.tar.gz
RUN mv grafana-7.4.5 /usr/share/grafana
RUN rm -f grafana-enterprise-7.4.5.linux-amd64.tar.gz
RUN chmod 640 /var/srcs/grafana.db
RUN mkdir -p /usr/share/grafana/data
RUN mv /var/srcs/grafana.db /usr/share/grafana/data/

EXPOSE 3000

WORKDIR	/usr/share/grafana/

CMD ["./bin/grafana-server"]
