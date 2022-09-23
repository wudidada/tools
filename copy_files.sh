#!/bin/sh

filelist=~/Downloads/diff.txt

src_dir=~/Code/webrtc/src
dst_dir=~/Downloads/e2ee

while IFS= read -r line
do
  dst_path=${dst_dir}/${line}
  mkdir -p $(dirname $dst_path)
  cp -R ${src_dir}/${line} ${dst_path}
done < $filelist