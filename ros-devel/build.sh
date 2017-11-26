#!/bin/sh
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

false

cp Dockerfile Dockerfile.bkp
sed -e "s/SRC-TAG/${ros_distro}/" Dockerfile.bkp > Dockerfile

docker build -t $image_name --build-arg ros_distro=${ros_distro} .

mv Dockerfile.bkp Dockerfile
