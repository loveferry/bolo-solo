FROM maven:3-jdk-8-alpine as MVN_BUILD

WORKDIR /opt/bolo/

COPY . /tmp/
