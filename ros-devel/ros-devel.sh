#!/bin/sh

. ../ros-common/ros-common.sh

docker run -it \
	$docker_opts \
	-h ros-devel \
	hrnr/ros-devel:${ros_distro}
