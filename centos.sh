#!/bin/sh

DOCKER_GID=1724
DOCKER_UID=1724
GROUP=dev
USER=dev
APP_HOME=/home/dev

# Install extra package
yum install -y  sudo git wget curl ca-certificates zip vim make bash &&\
yum clean all && \
rm -rf /tmp/* /var/tmp/*

# Create user and group
groupadd --gid ${DOCKER_GID} ${GROUP} && \
useradd -c "User for che" -d ${APP_HOME} -m -g ${GROUP} -s /bin/bash -u ${DOCKER_UID} ${USER} &&\
echo "%dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/dev

# Install gitflow
cd /opt
curl -LO https://raw.github.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh
sh gitflow-installer.sh install stable
rm gitflow-installer.sh

