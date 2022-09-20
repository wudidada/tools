#!/bin/sh

if [ $# -lt 2 ]; then
    echo 'command syntax: diff_dir dir1 dir2'
    exit 1
fi

dir1=$1
dir2=$2

echo $1
echo $2

dir1_out='/tmp/diff_1.list'
dir2_out='/tmp/diff_2.list'

cd ${dir1} && find . -print | sort > ${dir1_out} || exit 1
cd ${dir2} && find . -print | sort > ${dir2_out} || exit 1


diff ${dir1_out} ${dir2_out}
# rm ${dir1_out} ${dir2_out}
