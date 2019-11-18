#!/bin/sh

GID=1724
UID=1724
GROUP=dev
USER=dev
APP_HOME=/home/dev

# Install extra package
apk --update add sudo git wget curl ca-certificates iputils zip vim make bash coreutils &&\
rm -rf /var/cache/apk/*

# Create user and group
addgroup -g ${GID} ${GROUP} && \
adduser -g "${USER} user" -D -h ${APP_HOME} -G ${GROUP} -s /bin/bash -u ${UID} ${USER} &&\
echo "%dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/dev

# Install gitflow
cd /opt
curl -LO https://raw.github.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh
sh gitflow-installer.sh install stable
rm gitflow-installer.sh
