#!/bin/sh

. ../ros-common/ros-common.sh

device=/dev/$(readlink /dev/astra)

docker run -it \
	$docker_opts \
	-h ros-astra \
	--device=$device \
	-v /dev/astra:/dev/astra \
	hrnr/ros-devel:${ros_distro}
