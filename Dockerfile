FROM alpine:3.7

RUN set -x \
   && apk --no-cache add \
       # speed up from 26 secs down to 9.7 secs on my laptop
       libgomp \
    && apk --no-cache add --virtual .builddeps \
        build-base \
        git \
        wget \
    && git clone https://github.com/pjreddie/darknet \
    && cd darknet \
    ## Enable OPENMP 
    && sed -ri 's/^OPENMP=0/OPENMP=1/' Makefile \
    ## [Error : "unknown type name 'fd_set' #318](https://github.com/pjreddie/darknet/issues/318)
    && sed -ri 's!^(#include <unistd.h>)!\1\n#include <sys/select.h>!' examples/go.c \
    && make \
    && make clean \
    && wget -q https://pjreddie.com/media/files/yolov3.weights \
    && apk del .builddeps