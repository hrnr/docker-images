#!/bin/sh

if [ ! -p /tmp/qsurf.fifo ]; then
	mkfifo /tmp/qsurf.fifo
fi

docker run -d \
	--user $(id -u):$(id -g) \
	--group-add $(getent group audio | cut -d: -f3) \
	--net host \
	--memory 1024mb \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=$HOME/.Xauthority \
	-v /dev/shm:/dev/shm \
	-v /tmp/qsurf.fifo:/tmp/qsurf.fifo:rw \
	--device /dev/snd \
	--device /dev/dri/card0 \
	\
	-v $HOME/.config:$HOME/.config:ro \
	-v $HOME/C++/qsurf/usr.sh:$HOME/C++/qsurf/usr.sh:ro \
	-v $HOME/.icons:$HOME/.icons:ro \
	-v /usr/share/icons:/usr/share/icons:ro \
	-v $HOME/.local/share/qsurf:$HOME/.local/share/qsurf:rw \
	-v $HOME/.cache/qsurf:$HOME/.cache/qsurf:rw \
	-v $HOME/Downloads:$HOME/Downloads:rw \
	-v $HOME/.pki:$HOME/.pki:rw \
	--rm=true \
	--name=qsurf-daemon \
	--entrypoint="daemon.sh" \
	hrnr/qsurf
