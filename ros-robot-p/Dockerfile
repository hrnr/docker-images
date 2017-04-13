FROM hrnr/ros-devel:kinetic

RUN apt update && apt install -y \
	ros-kinetic-serial \
	ros-kinetic-ros-control \
	ros-kinetic-ros-control-boilerplate \
	ros-kinetic-ros-controllers \
	ros-kinetic-rplidar-ros \
	mc \
	tmux \
	clang

# cleanup
RUN rm -rf /var/lib/apt/lists/*
