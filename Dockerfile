FROM docker.io/library/maven:3.8-jdk-8-openj9@sha256:6a670ff83da03ed0a9ac43ceb582c1ce656684678022c81e89f05f5833d3e83a as MVN_BUILD

WORKDIR /opt/bolo/
ADD . /tmp/
RUN cd /tmp/ && mvn clean package && mv target/bolo/* /opt/bolo/ \
    && cp -f /tmp/src/main/resources/docker/* /opt/bolo/WEB-INF/classes/

FROM openjdk:8-alpine

WORKDIR /opt/bolo/
COPY --from=MVN_BUILD /opt/bolo/ /opt/bolo/
RUN apk add --no-cache ca-certificates tzdata

ENV TZ=Asia/Shanghai
EXPOSE 8080

ENTRYPOINT [ "java", "-cp", "WEB-INF/lib/*:WEB-INF/classes", "org.b3log.solo.Starter" ]
