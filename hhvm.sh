#!/bin/bash
# Copyright (C) 2014-2015 Miquel Sabaté Solà <mikisabate@gmail.com>
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

set -e

# Getting HHVM and compiling it as described in:
# https://github.com/facebook/hhvm/wiki/Building-and-installing-HHVM-on-Debian-8
cd /home/mssola
git clone https://github.com/facebook/hhvm.git --depth=1
cd hhvm
git submodule update --init --recursive
cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
make -j 10 install

