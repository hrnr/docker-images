#!/bin/sh

ros_latest=$(cat ros-latest)

docker run -it \
	--user $(id -u) \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /etc/sudoers.d:/etc/sudoers.d:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=/home/$USER/.Xauthority \
	-v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
	-e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
	-v /home/$USER/.ros_home:/home/$USER \
	-v /home/$USER/robocup:/home/$USER/robocup \
	-v /home/$USER/ros:/home/$USER/ros \
	-v /home/$USER/.zshrc:/home/$USER/.zshrc:ro \
	-v /home/$USER/.gitconfig:/home/$USER/.gitconfig:ro \
	--workdir=/home/$USER/ros/workspace \
	--device /dev/video0 \
	--name ros-devel \
	-h ros-devel \
	--rm=true \
	hrnr/ros-devel-${1:-$ros_latest}

