#!/bin/sh
#	-v /home/$USER/.zshrc:/home/$USER/.zshrc:ro \
#	-v /home/$USER/.zshrc.local:/home/$USER/.zshrc.local:ro \
docker run -it \
	--user $(id -u) \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /etc/sudoers:/etc/sudoers:ro \
	-v /etc/sudoers.d:/etc/sudoers.d:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /home/$USER/.alpine_home:/home/$USER \
	-v /home/$USER/.gitconfig:/home/$USER/.gitconfig:ro \
	-v /home/$USER/alpine:/home/$USER/alpine:rw \
	--workdir=/home/$USER/alpine \
	--name alpine \
	-h alpine \
	--rm=true \
	hrnr/alpine

