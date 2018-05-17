#!/bin/sh

#usage: ./build.sh distro [docker_src_tag [docker_dst_tag]]

set -e

. ../ros-common/ros-common.sh

src_tag=${2:-$ros_distro-desktop-full}
image_name=${3:-hrnr/ros-devel:${ros_distro}}

echo Distro is: $ros_distro
echo Will build image from: $src_tag
echo Final image to be build is: $image_name

# confirm building
echo -n "Continue? [y/N] "
read -r response
if [ "$response" != "y" ]; then
	exit 1
fi

sed -e "s/SRC-TAG/${src_tag}/" Dockerfile.in > Dockerfile

docker build -t $image_name --build-arg ros_distro=${ros_distro} .

rm Dockerfile
