FROM hrnr/ros-devel-kinetic

#python libraries for building
RUN apt update && apt install -y \
	python3-dev python3-future
# build ycmd
RUN git clone https://github.com/Valloric/ycmd && \
	cd ycmd && \
	git submodule update --init --recursive && \
	python3 ./build.py --clang-completer
WORKDIR /ycmd

# cleanup
RUN rm -rf /var/lib/apt/lists/*

# fix opencv3 completition in ros jade
# we need to prefer opencv bundled with ROS
RUN rm -rf /usr/include/opencv2

EXPOSE 49549
USER daemon
# start ycmd daemon -- port 49549, autokill in 12h
ENTRYPOINT ["python3", "-m", "ycmd", "--host=0.0.0.0", "--port=49549", "--options_file=/etc/ycmd/default_settings.json", "--idle_suicide_seconds=43200", "--log=debug"]

