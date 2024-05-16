FROM ubuntu:18.04
LABEL Purpose:  Ubuntu with XRDP Base Image
LABEL Author:   daemonchild
LABEL Tag:      daemonchild/ubuntu-xrdp-base
LABEL Version:  v0.1

EXPOSE 3389

ARG LOCALUSER="i_am_not_a_user_name"
ARG LOCALPASS="I_am_not_a_password"

# Install locale and set
#RUN apt-get update &&            \
#    apt-get install -y           \
#      apt-utils locales &&                 \
#    apt-get clean &&             \
#    rm -rf /var/lib/apt/lists/*
# Before installing desktop, set the locale to UTF-8
# see https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-ubuntu-docker-container
#RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && \
#    locale-gen
#ENV LANG en_GB.UTF-8
#ENV LANGUAGE en_GB:en
#ENV LC_ALL en_GB.UTF-8

RUN apt-get update &&            \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      software-properties-common \
      bash-completion  \
      openssh-server   \
      sudo             \
      vim              \
      wget             \
      curl              \
      net-tools     \
      cowsay && \
    apt-get clean &&             \
    rm -rf /var/lib/apt/lists/*

COPY --chown=root:root scripts/ /scripts
RUN chmod +x /scripts/*.sh
    
# Create user account with password-less sudo abilities
RUN useradd -s /bin/bash -g 100 -u 1000 -G sudo -m ${LOCALUSER} && \
    /usr/bin/printf '%s\n%s\n' ${LOCALPASS} ${LOCALPASS}| passwd ${LOCALUSER} && \
    echo "${LOCALUSER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Setup XRDP and XFCE
RUN /scripts/setup-desktop-xrdp.sh

# Entry point script
ENTRYPOINT ["/bin/bash", "-c", "/scripts/entrypoint.sh"]