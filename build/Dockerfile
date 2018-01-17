FROM ubuntu:14.04
MAINTAINER MadRussian <3382617+MadRussian@users.noreply.github.com>
ENV HOSTNAME b3coin-docker

# Argument to set the number of cores available to speed up compilation.
# Set this via: `docker build --build-arg MAKE_JOBS=N ...`
# For example if you have 4 cores do:
# `docker build --build-arg MAKE_JOBS=4 ..`
ARG MAKE_JOBS=1

# Install dependencies
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -qy \
  build-essential \
  libssl-dev \
  libdb++-dev \
  libboost-all-dev \
  libqrencode-dev \
  git

# Dependencies for qt
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -qy \
  qt5-default \
  qt5-qmake \
  qtbase5-dev-tools \
  qttools5-dev-tools \
  libboost-dev \
  libboost-system-dev \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-thread-dev \
  libminiupnpc-dev

# Dependencies for VNC
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -qy \
  vim \
  x11vnc \
  xvfb \
  openbox

# Download git repo
RUN git clone https://github.com/B3-Coin/B3-CoinV2.git /b3coin

# Run qmake
RUN cd /b3coin && qmake

# Run make
RUN cd /b3coin && make -j$MAKE_JOBS

# Create the directory where the wallet will be stored
RUN mkdir /root/.B3-CoinV2

# VNC
EXPOSE 5999

ADD start.sh /start.sh
ENTRYPOINT /start.sh
