FROM nginx:alpine

RUN apk update \
    && apk upgrade \
    && apk add -f --no-cache openssl socat 

ENV AUTO_UPGRADE=1
ENV LE_WORKING_DIR=/acme.sh
ENV LE_CONFIG_HOME=/acmecerts

RUN wget -O- https://get.acme.sh | sh && crontab -l | sed 's#> /dev/null##' | crontab -

RUN rm -rf /var/cache/apk/*

VOLUME ["/acmecerts"]
EXPOSE 443
