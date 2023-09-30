#!/usr/bin/env bash

./dev/asdf/java.sh

cd /tmp

VERSION=3.9.5
LINK=https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$VERSION/gatling-charts-highcharts-bundle-$VERSION-bundle.zip

wget -O gatling.zip $LINK

unzip gatling.zip
rm gatling.zip
sudo mv gatling-charts-highcharts-bundle-3.9.5 /opt/gatling
sudo ln -s /opt/gatling/bin/gatling.sh /usr/local/bin/gatling
