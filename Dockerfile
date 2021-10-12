FROM maven:3-jdk-8-alpine as MVN_BUILD

WORKDIR /opt/bolo/

COPY . /tmp/

RUN cd /tmp/ && mvn -DskipTests -Pci -q

FROM openjdk:8-alpine

WORKDIR /opt/bolo/

COPY --from=MVN_BUILD /opt/bolo/ /opt/bolo/

RUN apk add --no-cache ca-certificates tzdata

ENV TZ=Asia/Shanghai


