# forked from https://github.com/angristan/docker-pleroma
# MIT License
# Copyright (c) 2019 Aries(orlea)
# Copyright (c) 2018 Angristan


FROM elixir:1.9-alpine AS build

ENV UID=911 GID=911 \
    MIX_ENV=prod

ARG PLEROMA_VER=develop

RUN apk -U upgrade \
    && apk add --no-cache \
       build-base \
       git \
       imagemagick \
       gcc \
       g++ \
       musl-dev \
       make

RUN addgroup -g ${GID} pleroma \
    && adduser -h /pleroma -s /bin/sh -D -G pleroma -u ${UID} pleroma

USER pleroma
WORKDIR /pleroma

RUN git clone -b develop https://git.pleroma.social/pleroma/pleroma.git /pleroma \
    && git checkout ${PLEROMA_VER}

RUN touch /pleroma/config/prod.secret.exs

RUN mix local.rebar --force \
    && mix local.hex --force \
    && mix deps.get --only prod \
    && mkdir release \
    && mix release --path release \
    && echo "${OTP_VERSION}" > release/OTP_VERSION

FROM alpine:3.9

ENV UID=911 GID=911

ARG HOME=/opt/pleroma
ARG DATA=/var/lib/pleroma

RUN apk -U upgrade \
    && apk add --no-cache \
       imagemagick \
       ncurses

RUN addgroup -g ${GID} pleroma \
    && adduser -h ${HOME} -s /bin/sh -D -G pleroma -u ${UID} pleroma \
    && mkdir -p ${DATA}/uploads \
	&& mkdir -p ${DATA}/static \
	&& chown -R pleroma ${DATA} \
	&& mkdir -p /etc/pleroma \
	&& chown -R pleroma /etc/pleroma

USER pleroma

COPY --from=build --chown=pleroma:pleroma /pleroma/release ${HOME}

RUN touch /etc/pleroma/config.exs

EXPOSE 4000

CMD ["/opt/pleroma/bin/pleroma", "start"]
