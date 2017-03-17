FROM alpine:edge

WORKDIR /surf

# base build image
RUN apk --update add --virtual build-dependencies git build-base
# dependencies for surf
RUN apk --update add webkit2gtk webkit2gtk-dev
# make and install surf
RUN git clone https://github.com/hrnr/surf.git \
  && cd surf \
  && git checkout webkit2-myconfig \
  && make clean install
RUN apk --update add dmenu
# clean build depends and files
RUN apk del build-dependencies webkit2gtk-dev \
  && rm -rf /surf \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["surf"]