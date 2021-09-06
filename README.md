# nmag-containers

[![Build Docker Image Ubuntu 12.04](https://github.com/fangohr/nmag-containers/actions/workflows/docker-image-1204.yml/badge.svg)](https://github.com/fangohr/nmag-containers/actions/workflows/docker-image-1204.yml)

Towards compilation of Nmag in containers, and subsequent use from inside the
container.

The [docker](./ubuntu-docker/1204) and [singularity](./ubuntu-singularity/1204) ubuntu 12.04 containers are in working order.
Execution instructions can be found in their respective directories.

[The other images in `archive` do not work yet. From memory: seems to compile,
but "nsim" doesn't show a python prompt and/or tests fail.]

