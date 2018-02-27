FROM alpine

ENV LANG C.UTF-8

COPY REST-wrapper /ps4waker-rest

RUN apk update \
         && apk upgrade \
         && apk add --no-cache ca-certificates \
         && update-ca-certificates \
         && apk add --no-cache \
                               curl \
                               jq \
                               nodejs \
                               nodejs-npm \
          && cd ps4waker-rest \
          && npm config set unsafe-perm true \
          && npm install -g . \
          && npm config set unsafe-perm false \
          && cd \
          && mkdir -p /waker/data \
          && apk del curl \
          && rm -rf /var/cache/apk/* \
          && rm -rf ps4waker-rest

COPY run.sh /

RUN chmod a+x /run.sh

VOLUME ["/waker/data"]

EXPOSE 3031

CMD [ "/run.sh" ]
