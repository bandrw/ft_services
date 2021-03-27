#!/bin/sh

/usr/sbin/influxd run -config /etc/influxdb.conf -pidfile /var/run/influxd.pid &

sleep 1
influx -execute "CREATE DATABASE telegraf"
while [ "$?" -eq 1 ]
do
	sleep 1
	influx -execute "CREATE DATABASE telegraf"
done

influx -execute "CREATE USER kfriese WITH PASSWORD 'kfriese'"
influx -execute "GRANT ALL ON telegraf TO kfriese"
kill -SIGTERM $(cat /var/run/influxd.pid)

/usr/bin/supervisord -c /etc/supervisord.conf
