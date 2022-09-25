#!/bin/sh

ninja_dir="arm64"
if [ $# -gt 0 ]
then
    ninja_dir="arm64_release"
fi

PROJECT_DIR='/Users/jusbin/Code/RTCStartupDemo/RTCClientDemo/Android/RTCDroidDemo'
rsync -av root@47.90.134.43:/usr/webrtc/WebRTC/src/out/${ninja_dir}/libjingle_peerconnection_so.so $PROJECT_DIR/libwebrtc/src/main/jniLibs/arm64-v8a