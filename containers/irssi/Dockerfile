FROM irssi:1.0.1-alpine

ENV PERL_MM_USE_DEFAULT 1

USER root

# twirrsi deps
RUN apk add -U make build-base perl-dev openssl openssl-dev \
  && cpan App::cpanminus \
  && cpanm \
    WWW::Shorten::TinyURL \
    Net::Twitter \
    JSON::Any \
    Text::CharWidth \
  && apk del make build-base perl-dev openssl-dev

RUN apk add tzdata \
  && echo "Europe/Brussels" > /etc/timezone
USER user
