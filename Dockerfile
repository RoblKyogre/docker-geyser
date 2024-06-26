ARG BASE_IMAGE=eclipse-temurin:21-jre-alpine
FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add uuidgen wget
COPY /root /

WORKDIR /app
ADD "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone" /app/Geyser.jar

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 19132/udp
