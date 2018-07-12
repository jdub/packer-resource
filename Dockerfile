FROM alpine:latest

ARG PACKER_VER=1.2.4

RUN apk --no-cache add jq ca-certificates openssh-client sed openssl \
  && wget -O /tmp/packer.zip \
    "https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip" \
  && unzip -o /tmp/packer.zip -d /usr/local/bin \
  && rm -f /tmp/packer.zip \
  && apk --no-network del openssl

ADD bin /opt/resource
