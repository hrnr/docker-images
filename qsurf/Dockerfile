FROM base/archlinux

# install qt and all deps
RUN pacman --noconfirm -Syu \
	qt5-webengine \
	dmenu \
	base-devel \
	git \
	ttf-croscore \
	ttf-dejavu

RUN pacman --noconfirm -Sy perl-uri

# configure fonts
RUN cd /etc/fonts/conf.d && \
	rm 10-hinting-slight.conf && \
	ln -s /etc/fonts/conf.avail/10-autohint.conf && \
	ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf && \
	cd /

# make and install surf
RUN git clone https://github.com/hrnr/qsurf.git \
  && cd qsurf \
  && qmake && make \
  && mv qsurf /usr/local/bin

WORKDIR /qsurf

ADD daemon.sh /usr/local/bin/daemon.sh

RUN mkdir /home/henry && \
	chown 1000:1000 /home/henry/

ENTRYPOINT ["daemon.sh"]
