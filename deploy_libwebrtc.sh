#!/bin/sh

LIB_TAR='/Users/jusbin/Downloads/libwebrtc.tar.gz'
PROJECT_DIR='/Users/jusbin/Code/RTCStartupDemo/RTCClientDemo/Android/RTCDroidDemo'

if [ $# == 1 ]
then
    PROJECT_DIR=$1
fi

lib_dir=${LIB_TAR%%.*}
rm -rf $lib_dir

tar -zxf $LIB_TAR -C $(dirname ${lib_dir})

# start to deploy
mkdir -p $PROJECT_DIR/libwebrtc/src/main
rsync -av --delete $lib_dir/java/ $PROJECT_DIR/libwebrtc/src/main/java

mkdir -p $PROJECT_DIR/libwebrtc/src/main/jniLibs
rsync -av $lib_dir/jni/libjingle_peerconnection_so.so $PROJECT_DIR/libwebrtc/src/main/jniLibs/arm64-v8a

rsync -av $lib_dir/AndroidManifest.xml $PROJECT_DIR/libwebrtc/src/main