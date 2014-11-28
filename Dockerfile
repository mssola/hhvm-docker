# Copyright (C) 2014 Miquel Sabaté Solà <mikisabate@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


FROM debian:jessie
MAINTAINER Miquel Sabaté Solà <mikisabate@gmail.com>
USER root

# Update & upgrade
RUN apt-get update -qq
RUN apt-get install -y apt-utils
RUN apt-get upgrade -qq

# Install all the required packages as described in:
# https://github.com/facebook/hhvm/wiki/Building-and-installing-HHVM-on-Debian-8
RUN apt-get install -y git-core cmake libmysqlclient-dev \
  libxml2-dev libmcrypt-dev libicu-dev openssl build-essential binutils-dev \
  libcap-dev zlib1g-dev libtbb-dev libonig-dev libpcre3-dev autoconf libtool \
  libcurl4-openssl-dev wget memcached libreadline-dev libncurses5-dev \
  libmemcached-dev libbz2-dev libc-client2007e-dev php5-mcrypt php5-imagick \
  libgoogle-perftools-dev libcloog-ppl-dev libelf-dev libdwarf-dev \
  libunwind8-dev subversion libtbb2 libtbb-dev g++-4.8 gcc-4.8 \
  libjemalloc-dev libc6-dev libmpfr4 libgcc1 binutils libc6 libc-dev-bin \
  libc-bin libgomp1 libstdc++-4.8-dev libstdc++6 libarchive13 cmake-data \
  libacl1 libattr1 g++ cpp gcc make libboost-thread1.55.0 libboost-thread-dev \
  libgd2-xpm-dev pkg-config  binutils-dev libboost-system1.55-dev \
  libboost-program-options1.55-dev libboost-filesystem1.55-dev \
  libboost-regex1.55-dev libmagickwand-dev libiberty-dev libevent-dev \
  libxslt-dev libgoogle-glog-dev automake libldap2-dev libkrb5-dev \
  ocaml-native-compilers sudo


# Create the 'mssola' user and create the home dir.
RUN useradd -m -d /home/mssola -s /bin/bash -G users mssola
RUN chown mssola:users /home/mssola
RUN adduser mssola sudo

# Add the `hhvm` and the `utils` helper scripts.
ADD hhvm.sh /home/mssola/hhvm.sh
ADD utils.sh /home/mssola/utils.sh

