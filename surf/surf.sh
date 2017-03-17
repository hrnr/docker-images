#!/bin/sh

# 	--device /dev/snd \
#	--device /dev/dri \
#	--device /dev/usb \
#	--device /dev/bus/usb \

# xauth -f docker.Xauthority.hostname-specific generate :0 . untrusted


sudo docker run -it \
	--net host \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.Xauthority:/root/.Xauthority:ro \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=/root/.Xauthority \
	-v $HOME/Downloads:/root/Downloads \
	-v $HOME/Pictures:/root/Pictures \
	-v $HOME/.surf:/root/.surf \
	-v /dev/shm:/dev/shm \
	-v /etc/hosts:/etc/hosts \
	--device /dev/video0 \
	--name surf \
	--rm=true \
	--entrypoint=sh \
	hrnr/surf
