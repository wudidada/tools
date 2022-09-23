#!/bin/sh

PROJECT_DIR='/Users/jusbin/Code/RTCStartupDemo/RTCClientDemo/Android/RTCDroidDemo'
rsync -av root@47.90.134.43:/usr/webrtc/WebRTC/src/out/arm64_new/libjingle_peerconnection_so.so $PROJECT_DIR/libwebrtc/src/main/jniLibs/arm64-v8a