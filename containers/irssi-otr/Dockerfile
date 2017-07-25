FROM nicolai86/irssi:1.0.4-alpine

ENV IRSSI_OTR_VERSION 1.0.2

USER root

RUN apk --no-cache add curl

RUN set -x \
  && mkdir -p /usr/include \
  && curl -L -o /tmp/irssi.tar.xz "https://github.com/irssi/irssi/releases/download/${IRSSI_VERSION}/irssi-${IRSSI_VERSION}.tar.xz" \
  && tar -xJf /tmp/irssi.tar.xz -C /usr/include \
  && mv /usr/include/irssi-${IRSSI_VERSION} /usr/include/irssi \
  && rm /tmp/irssi.tar.xz

RUN set -x \
  && apk add --no-cache --virtual .build-deps \
    libotr \
    libotr-dev \
    libgcrypt \
    libgcrypt-dev \
    autoconf \
    automake \
    gcc \
    glib-dev \
    gnupg \
    libc-dev \
    libtool \
    lynx \
    make \
    ncurses-dev \
    openssl-dev \
    perl-dev \
    pkgconf \
  && curl -L -o /tmp/irssi-otr.tar.gz https://github.com/cryptodotis/irssi-otr/archive/v${IRSSI_OTR_VERSION}.tar.gz \
  && mkdir -p /usr/src \
  && tar -xzf /tmp/irssi-otr.tar.gz -C /usr/src \
  && cd /usr/src/irssi-otr-${IRSSI_OTR_VERSION} \
  && ./bootstrap \
  && ./configure --prefix="/usr" \
  && make \
  && make install \
  && mv /usr/lib/irssi/modules/libotr.so /usr/local/lib/irssi/modules/libotr.so \
  && rm -rf /usr/src/irssi-otr-${IRSSI_OTR_VERSION} \
  && runDeps="$( \
    scanelf --needed --nobanner --recursive /usr/local \
      | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
      | sort -u \
      | xargs -r apk info --installed \
      | sort -u \
  )" \
  && apk add --no-cache --virtual .irssi-rundeps $runDeps \
  && apk del .build-deps

USER user
CMD ["irssi"]
