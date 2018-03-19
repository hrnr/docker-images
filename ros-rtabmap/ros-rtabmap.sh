#!/bin/sh

ROS_WORKSPACE=$HOME/ros/workspace-kinetic
. ../ros-common/ros-common.sh

docker run -it \
	$docker_opts \
	-h ros-rtabmap \
	hrnr/ros-rtabmap:kinetic
