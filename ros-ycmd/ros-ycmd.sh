#!/bin/sh

. ../ros-common/ros-common.sh

# start ycmd daemon -- port 4954, autokill in 12h
ycmd_command="ycmd --host=0.0.0.0 --port=49549 --options_file=/etc/ycmd/default_settings.json --idle_suicide_seconds=43200 --log=debug"

# run ycmd on 49549
docker run -d \
	--expose=49549 \
	--user=daemon \
	-p 127.0.0.1:49549:49549 \
	-v /home/$USER/.config/ycmd:/etc/ycmd:ro \
	-v /home/$USER:/home/$USER:ro \
	-e ROSWORKSPACE=$ros_workspace \
	--name ros-ycmd \
	--entrypoint="" \
	hrnr/ros-devel:${ros_distro} \
	$ycmd_command
