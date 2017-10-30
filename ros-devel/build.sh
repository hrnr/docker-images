#!/bin/sh

ros_latest=$(cat ros-latest)
ros_version=${1:-$ros_latest}

cp Dockerfile Dockerfile.bkp
sed -e "s/kinetic/${ros_version}/" Dockerfile.bkp > Dockerfile

IMAGE_NAME=${IMAGE_NAME:-hrnr/ros-devel:${ros_version}}

docker build -t $IMAGE_NAME --build-arg ros_version=${ros_version} .

mv Dockerfile.bkp Dockerfile
