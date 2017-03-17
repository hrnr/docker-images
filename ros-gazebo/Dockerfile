FROM hrnr/ros-devel
ARG ros_version

# additional ros packages
RUN apt update && apt install -y \
	ros-${ros_version}-turtlebot-gazebo

# cleanup
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["zsh"]

