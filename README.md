## Add cross-build capability to an Alpine 3.5 image.

# Intro

If you are like me and you are interested in building containers for the aarch64/arm64 chip architecture then you have come to the right place. This git repo adds qemu to an aarch64 Alpine 3.5 image. It also contains a go based script that allows you do start intercepting all shell commands and start executing them on qemu. This allows you to build aarch64 images on a x86 machine like dockerhub!

# Static aarch64 qemu binary

