FROM ubuntu:23.04

WORKDIR /app

COPY ./scripts /app/scripts
COPY ./run_all.sh /app/run_all.sh

ARG DEBIAN_FRONTEND=noninteractive
ARG SFTP_HOST

RUN apt-get update -y && apt install -y --no-install-recommends openssh-client && rm -rf /var/lib/apt/lists/*

RUN chmod +x /app/run_all.sh

# SFTP configuration
RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh

RUN touch ~/.ssh/known_hosts && chmod 644 ~/.ssh/known_hosts

RUN ssh-keyscan ${SFTP_HOST} >> ~/.ssh/known_hosts

ENTRYPOINT ["/bin/bash", "run_all.sh"]
