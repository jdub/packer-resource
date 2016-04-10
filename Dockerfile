FROM alpine:latest

RUN apk --no-cache add jq

ARG PACKER_VER=0.10.0
ENV PACKER_ZIP=packer_${PACKER_VER}_linux_amd64.zip

ADD https://releases.hashicorp.com/packer/${PACKER_VER}/${PACKER_ZIP} /tmp
RUN unzip -o /tmp/${PACKER_ZIP} -d /usr/local/bin && rm -f /tmp/${PACKER_ZIP}

ADD bin /opt/resource
RUN chmod a+rx,go-w /opt/resource/*
