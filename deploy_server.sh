#!/bin/zsh

source ~/.zshrc
cm || exit 1
update_code.sh $1 || exit 1
gl || exit 1
compile_peerconnection.sh