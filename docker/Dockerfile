FROM ubuntu:jammy

RUN apt-get update \
&& apt-get install -y --no-install-recommends git wget

RUN apt-get install -y --no-install-recommends ca-certificates devscripts equivs

COPY build-in-docker.sh .