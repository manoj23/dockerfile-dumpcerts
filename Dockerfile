FROM alpine:3.7
LABEL maintainer="Georges Savoundararadj <savoundg@gmail.com>"
RUN apk add --no-cache bash jq openssl
COPY dumpcerts.sh /usr/local/bin/
COPY update-ca-certificates-from-acme-json.sh /etc/periodic/weekly/
VOLUME [ "/etc/ssl/" ]
CMD crond -f -l 5
