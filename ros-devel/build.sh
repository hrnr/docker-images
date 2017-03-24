#!/bin/sh

# first input argument should be ros version
[ -n $1 ] || exit 1
ros_version=$1

cp Dockerfile Dockerfile.bkp
sed -e "s/kinetic/${ros_version}/" Dockerfile.bkp > Dockerfile

docker build -t hrnr/ros-devel-${ros_version} --build-arg ros_version=${ros_version} .

mv Dockerfile.bkp Dockerfile
