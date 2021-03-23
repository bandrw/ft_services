#!/bin/sh

influxd run -pidfile /var/run/influxd.pid &
influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER kfriese WITH PASSWORD 'kfriese'"
influx -execute "GRANT ALL ON grafana TO kfriese"
kill -SIGTERM $(cat /var/run/influxd.pid)

/usr/sbin/influxd
