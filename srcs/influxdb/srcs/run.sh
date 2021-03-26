#!/bin/sh

influxd run -pidfile /var/run/influxd.pid &

sleep 1
influx -execute "CREATE DATABASE grafana"
while [ "$?" -eq 1 ]
do
	sleep 1
	influx -execute "CREATE DATABASE grafana"
done

influx -execute "CREATE USER kfriese WITH PASSWORD 'kfriese'"
influx -execute "GRANT ALL ON grafana TO kfriese"
kill -SIGTERM $(cat /var/run/influxd.pid)

/usr/bin/supervisord -c /etc/supervisord.conf
