FROM ubuntu:18.04
LABEL Purpose:  Ubuntu with XRDP Base Image
LABEL Author:   daemonchild
LABEL Tag:      daemonchild/ubuntu-xrdp-base
LABEL Version:  v1.0

EXPOSE 3389

# You really MUST change these values
ARG LOCALUSER="user"
ARG LOCALPASS="b4d_p4ssw0rd"

# Install Base Image
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

# Create user account 
RUN useradd -s /bin/bash -g 100 -u 1000 -G sudo -m ${LOCALUSER} && \
    /usr/bin/printf '%s\n%s\n' ${LOCALPASS} ${LOCALPASS}| passwd ${LOCALUSER} 

# Optional: add password-less sudo abilities
RUN echo "${LOCALUSER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Setup XRDP and XFCE
RUN /scripts/setup-desktop-xrdp.sh

# Entry point script
ENTRYPOINT ["/bin/bash", "-c", "/scripts/entrypoint.sh"]