ARG BASE_IMAGE=eclipse-temurin:25-jre-alpine
FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add uuidgen wget
COPY /root /

ADD "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone" /Geyser.jar

STOPSIGNAL SIGTERM

WORKDIR /data
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 19132/udp
