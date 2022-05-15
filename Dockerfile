# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc pkg-config bison flex

ADD . /dtc
WORKDIR /dtc
RUN make
