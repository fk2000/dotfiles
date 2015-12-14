#!/bin/bash -xeu

if [ ! -d tmux ]; then
    git clone https://github.com/tmux/tmux.git
fi

cd tmux

sh autogen.sh

./configure

make -j4

sudo make install
