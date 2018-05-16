#!/bin/bash
set -e

if [ ! -f postgresql-9.4.1209.jar ]; then
    curl -O https://jdbc.postgresql.org/download/postgresql-9.4.1209.jar
fi

if [ ! -f ojdbc7_g.jar ]; then
    echo "Download ojdbc7.jar from http://www.oracle.com/technetwork/database/features/jdbc/jdbc-drivers-12c-download-1958347.html"
    exit 1
fi

if [ ! -f db-derby-10.14.2.0-lib.zip ]; then
    curl -O http://apache.mirror.iphh.net//db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-lib.zip
fi

if [ ! -d db-derby-10.14.2.0-lib ]; then
    unzip db-derby-10.14.2.0-lib.zip
fi

docker build -t 38leinad/wlp-javaee7-jdbc:latest .