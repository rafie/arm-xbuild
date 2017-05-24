FROM project31/aarch64-centos:7

ENV QEMU_EXECVE 1

COPY . /usr/bin

RUN [ "qemu-aarch64-static", "/bin/sh", "-c", "ln -s resin-xbuild /usr/bin/cross-build-start; ln -s resin-xbuild /usr/bin/cross-build-end; ln /bin/sh /bin/sh.real" ]
