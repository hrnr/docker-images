FROM osrf/ros:kinetic-desktop-full
ARG ros_version

# convenience utils
RUN apt update && apt install -y \
	xterm \
	zsh \
	gdb \
	openssh-client \
	vim \
	less \
	tmux

# block zsh new user startup
RUN rm /usr/share/zsh/*/scripts/newuser

# additional ros packages
RUN apt install -y \
	ros-${ros_version}-teleop-twist-keyboard \
	ros-${ros_version}-tf2-bullet \
	ros-${ros_version}-tf2-eigen \
	ros-${ros_version}-robot-localization \
	ros-${ros_version}-move-base \
	ros-${ros_version}-perception \
	ros-${ros_version}-hector-mapping \
	ros-${ros_version}-opencv3 \
	ros-${ros_version}-map-server \
	python-bloom
# upgrade everything that is not updated in base docker image
RUN apt upgrade -y

# cleanup
RUN rm -rf /var/lib/apt/lists/*

ADD zshrc.local /etc/zsh/zshrc.local
ADD zshrc /etc/zsh/zshrc

ENTRYPOINT ["zsh"]
