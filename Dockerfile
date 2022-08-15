FROM debian:testing-slim

ARG UID=1000
ARG GID=1000
ARG USER=lucas
ARG GROUP=lucas

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        sudo \
        git \
        docker.io \
        docker-compose \
        curl \
        wget \
        xclip \
        bash-completion \
        flatpak-xdg-utils && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache/

RUN groupadd -g $GID $GROUP && \
    useradd -m -g $GID -u $UID -s /bin/bash $USER && \
    usermod -aG docker $USER && \
    usermod -aG sudo $USER && \
    passwd $USER

WORKDIR /home/$USER
USER $USER
RUN echo '\n\nPATH="/usr/libexec/flatpak-xdg-utils/:$PATH"\nexport PATH' >> .bashrc && \
    mkdir -p /home/${USER}/.local/bin /home/${USER}/.config

CMD ["tail", "-f", "/dev/null"]
