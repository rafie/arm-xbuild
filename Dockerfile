# BUILD redisfab/ubuntu-arm64-xbuild:bionic 

ARG BASE=ubuntu:bionic

# FROM docker.io/project31/aarch64-centos:7.3.1611
FROM ${BASE}

COPY bin/ /usr/bin/
