# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc pkg-config bison flex

ADD . /dtc
WORKDIR /dtc
RUN make

RUN mkdir -p /deps
RUN ldd /dtc/dtc | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /dtc/dtc /dtc/dtc
ENV LD_LIBRARY_PATH=/deps
