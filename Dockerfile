FROM docker.io/project31/aarch64-centos:7.3.1611

COPY bin/ /usr/bin/
# DNS calls are not working so replacing mirror.centos.org with the ip-address
COPY etc/ /etc
