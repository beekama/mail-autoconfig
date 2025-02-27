#!/bin/bash

FLASK_APP=automx2.server:app python -m flask run --host=0.0.0.0 --port 4243 &
#waitress-serve --host 0.0.0.0 --port 4243 --call automx2.server:app &
sleep 5
stat --format="%s" /home/automx2/automxdb.sqlite
curl http://127.0.0.1:4243/initdb/
stat --format="%s" /home/automx2/automxdb.sqlite
sqlite3 /home/automx2/automxdb.sqlite < /home/automx2/init.sql
sqlite3 /home/automx2/automxdb.sqlite "SELECT * FROM provider;"
sqlite3 /home/automx2/automxdb.sqlite "SELECT * FROM server;"
sqlite3 /home/automx2/automxdb.sqlite "SELECT * FROM domain;"
sqlite3 /home/automx2/automxdb.sqlite "SELECT * FROM server_domain;"
sleep infinity
