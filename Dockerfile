FROM alpine:3.7
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
RUN apk add --no-cache bash jq openssl
ADD https://raw.githubusercontent.com/containous/traefik/91ff94ea56587a3afa398b572bb7ae4185849091/contrib/scripts/dumpcerts.sh /usr/local/bin/
COPY update-ca-certificates-from-acme-json.sh /etc/periodic/weekly/
VOLUME [ "/etc/ssl/" ]
CMD crond -f -l 5
