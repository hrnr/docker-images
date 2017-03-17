#!/bin/sh

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
	-v /home/$USER/.ros_home:/home/$USER \
	-v /home/$USER/robocup:/home/$USER/robocup \
	-v /home/$USER/ros:/home/$USER/ros \
	-v /home/$USER/.zshrc:/home/$USER/.zshrc:ro \
	-v /home/$USER/.gitconfig:/home/$USER/.gitconfig:ro \
	--workdir=/home/$USER/ros/workspace \
	--device /dev/video0 \
	--name ros-gazebo \
	-h ros-gazebo \
	--rm=true \
	hrnr/ros-gazebo

