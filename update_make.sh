#!/bin/sh
# set -x

if [ $# -eq 0 -o ! -d $1 ]
then
    echo "update_make update-dir"
    exit 1
fi

out_dir=`pwd`
if [ "$2" ]
then
    out_dir=$2
fi

echo "out dir: ${out_dir}"

tar -zcf $out_dir/$(basename $1).tar.gz -C $(dirname $1) $(basename $1) 