#!/bin/sh

# common launch life setting variables for derived scripts

ros_distro=${1:-melodic}

default_workspace="$HOME/ros/workspace-${ros_distro}"
default_extra_dirs="$HOME/ros"
default_extra_devices="/dev/dri/card0"

ros_workspace=${ROS_WORKSPACE:-$default_workspace}
extra_dirs=${ROS_EXTRA_DIRS:-$default_extra_dirs}
extra_devices=${ROS_EXTRA_DEVICES:-$default_extra_devices}

extra_opts=""
for extra_dir in $extra_dirs; do
	if [ -d $extra_dir ]; then
		extra_opts="$extra_opts -v $extra_dir:$extra_dir "
	fi
done

if [ -n "$SSH_AUTH_SOCK" ]; then
	extra_opts="$extra_opts -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK "
	extra_opts="$extra_opts -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK "
fi

for dev in $extra_devices; do
	if [ -e $dev ]; then
		extra_opts="$extra_opts --device=$dev "
	else
		echo "!!! running without ${dev} !!!"
	fi
done

if [ ! -d $HOME/.ros_home ]; then
	mkdir $HOME/.ros_home
fi

# create docker_opts variable with all args for docker

docker_opts=$(cat <<EOF
--user $(id -u):$(id -g)
-v /etc/group:/etc/group:ro
-v /etc/passwd:/etc/passwd:ro
-v /etc/shadow:/etc/shadow:ro
-v /etc/sudoers.d:/etc/sudoers.d:ro
-v /etc/localtime:/etc/localtime:ro
-v /tmp/.X11-unix:/tmp/.X11-unix
-v /dev/shm:/dev/shm
-e DISPLAY=$DISPLAY
-e XAUTHORITY=$HOME/.Xauthority
-v $HOME/.ros_home:$HOME
-v $HOME/.gitconfig:$HOME/.gitconfig:ro
-e ROSWORKSPACE=$ros_workspace
-v $ros_workspace:$ros_workspace
$extra_opts
--workdir=$ros_workspace
--rm=true
EOF
)
