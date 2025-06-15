FROM ubuntu:noble

SHELL ["/bin/bash", "-c"]

# ================================
# apt
# ================================
RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt update && \
    apt install -y \
    curl \
    sudo \
    build-essential \
    make \
    locales \
    unzip \
    fontconfig \
    git \
    libncurses6 \
    libncurses-dev \
    binutils \
    unzip \
    gnupg2 \
    libc6-dev \
    libcurl4-openssl-dev \
    libedit2 \
    libgcc-13-dev \
    libpython3-dev \
    libsqlite3-0 \
    libstdc++-13-dev \
    libxml2-dev \
    libncurses-dev \
    libz3-dev \
    pkg-config \
    tzdata \
    zlib1g-dev \
    openssl \
    libssl-dev \
    && rm -r /var/lib/apt/lists/*

# ================================
# Swift Lover
# ================================
RUN echo 'swiftlover ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/swiftlover
RUN useradd --user-group --create-home --system --skel /dev/null --home-dir /swiftlover swiftlover
USER swiftlover:swiftlover
WORKDIR /swiftlover

# ================================
# Docker
# ================================
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sudo sh get-docker.sh

# ================================
# Setup Swift
# ================================
WORKDIR /swiftly
RUN NONINTERACTIVE=1 curl -O "https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz" && \
    tar zxf "swiftly-$(uname -m).tar.gz" && \
    ./swiftly init --quiet-shell-followup && \
    . ${SWIFTLY_HOME_DIR:-~/.local/share/swiftly}/env.sh && \
    hash -r && \
    echo "source ${SWIFTLY_HOME_DIR:-~/.local/share/swiftly}/env.sh" >> /swiftlover/.bashrc

# ================================
# Homebrew
# ================================
RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN echo >> /swiftlover/.bashrc
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /swiftlover/.bashrc
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
    brew install \
    vapor \
    git \
    node \
    swift-protobuf \
    aws-sam-cli \
    swift-format && \
    brew unlink swift
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

WORKDIR /swiftlover/workspace

# ================================
# Permission
# ================================
RUN sudo chown -R swiftlover:swiftlover /swiftly
RUN sudo chown -R swiftlover:swiftlover /swiftlover/workspace

# ================================
# Claude Code
# ================================
RUN npm install -g @anthropic-ai/claude-code