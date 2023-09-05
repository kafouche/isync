# Dockerfile: isync
# isync Docker Image.

FROM        alpine:latest

RUN         apk upgrade --no-cache --update \
            && apk --no-cache --update add \
                ca-certificates \
                isync \
            && mkdir --parents /mail

WORKDIR     "/mail"

ENV         TZ=Europe/Paris

VOLUME      [ "/mail" ]

ENTRYPOINT  [ "/usr/bin/mbsync", "-c", "/mail/mbsync.conf", "-V" ]
CMD         [ "-a" ]