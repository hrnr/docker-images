#!/bin/sh

ros_latest=$(cat ../ros-devel/ros-latest)

# run ycmd on 49549
docker run -d \
	-p 127.0.0.1:49549:49549 \
	-v /home/$USER/.config/ycmd:/etc/ycmd:ro \
	-v /home/$USER:/home/$USER:ro \
	--name ros-ycmd \
	hrnr/ros-ycmd

