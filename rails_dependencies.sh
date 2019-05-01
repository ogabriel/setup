#!/bin/bash
# rails dependencies

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev liblzma-dev

sudo apt-get install -y libmagick++-dev libcurl3-dev
sudo apt-get install -y sqlite3 libsqlite3-dev \
        mysql-server libmysqlclient-dev \
        postgresql postgresql-client postgresql-contrib libpq-dev \
        redis-server memcached imagemagick ffmpeg mupdf mupdf-tools \
        libaio1
