#!/bin/bash

DOCKERIMG=${DOCKERIMG:-mbessler/ff32-webex}

default_url=https://www.webex.com/go/attend-meeting
url=${1-$default_url}

xhost +local:webex-$(id -un)
docker run --rm --hostname=webex-$(id -un) -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged -v /dev/snd:/dev/snd -v $HOME/ff32webex:/webex ${DOCKERIMG} $url
