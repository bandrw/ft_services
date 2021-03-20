FROM alpine:3.11

ENV TZ=Europe/Moscow

RUN apk update && apk upgrade

COPY srcs /var/srcs

EXPOSE 8086

# CMD sh /var/srcs/run.sh
CMD ["tail", "-f", "/dev/null"]
