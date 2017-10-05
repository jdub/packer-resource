FROM alpine:latest

ARG PACKER_VER=1.1.0
ENV USER ansible

RUN apk --no-cache add jq bash git ca-certificates openssh-client sed openssl ansible \
  && wget -O /tmp/packer.zip \
    "https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip" \
  && unzip -o /tmp/packer.zip -d /usr/local/bin \
  && rm -f /tmp/packer.zip \
  && apk --no-network del openssl

ADD bin /opt/resource
