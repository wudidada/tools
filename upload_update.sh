#!/bin/sh
# set -x

REMOTE_HOST='47.90.134.43'
update_dir=~/Downloads/update
update_tar=${update_dir}.tar.gz

sh update_make.sh $update_dir $(dirname ${update_dir})

scp $update_tar root@47.90.134.43:/root