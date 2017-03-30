FROM hrnr/ros-devel:kinetic

RUN apt update && apt install -y \
	ros-kinetic-rosserial

# cleanup
RUN rm -rf /var/lib/apt/lists/*
