# stretch|bionic
ARG OSNICK=stretch

# arm32v7|arm64v8
ARG ARCH=arm64v8

FROM redisfab/${ARCH}-xbuild:${OSNICK}

RUN [ "cross-build-start" ]

RUN uname -a

RUN [ "cross-build-end" ]
