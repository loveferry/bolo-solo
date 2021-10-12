FROM docker.io/library/maven:3.8-jdk-8-openj9@sha256:6a670ff83da03ed0a9ac43ceb582c1ce656684678022c81e89f05f5833d3e83a as MVN_BUILD

WORKDIR /opt/bolo/
COPY . /tmp/
