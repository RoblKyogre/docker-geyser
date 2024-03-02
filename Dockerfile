ARG BASE_IMAGE=eclipse-temurin:21-jre-alpine
FROM ${BASE_IMAGE} as final

ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

RUN apk add uuidgen wget
COPY /root /

WORKDIR /app
RUN wget -O /app/Geyser.jar "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"

STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 19132/udp
