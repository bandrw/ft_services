FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

COPY srcs /var/srcs

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz
RUN tar xzf influxdb2-2.0.4-linux-amd64.tar.gz
RUN rm -f influxdb2-2.0.4-linux-amd64.tar.gz
RUN mv influxdb2-2.0.4-linux-amd64 /usr/share/influxdb

WORKDIR	/usr/share/influxdb/

# RUN ./influx config create -o school_21 -u http://192.168.99.100:8086 -a
# RUN ./influx user create -n kfriese -p kfriese123 -o School_21

EXPOSE 8086

# CMD ["./influxd"]
CMD ["tail", "-f", "/dev/null"]
