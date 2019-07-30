#!/bin/sh

GID=1724
UID=1724
GROUP=dev
USER=dev
APP_HOME=/home/dev

# Install extra package
apt-get update &&\
apt-get install -y --no-install-recommends sudo git wget curl ca-certificates iputils-ping zip vim make bash aptitude &&\
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create user and group
addgroup --gid ${GID} ${GROUP} && \
useradd -c "User for che" -d ${APP_HOME} -m -g ${GROUP} -s /bin/bash -u ${UID} ${USER} &&\
echo "%dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/dev

# Install gitflow
curl -LO https://raw.github.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh
sh gitflow-installer.sh install stable
rm gitflow-installer.sh

