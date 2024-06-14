FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    gcc

COPY ./hellow.c ./hellow.c

