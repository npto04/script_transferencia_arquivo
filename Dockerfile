FROM ubuntu:20.04

WORKDIR /app

COPY ./upload.sh /app/upload.sh

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt install -y --no-install-recommends openssh-client && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "upload.sh"]