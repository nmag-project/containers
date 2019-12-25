# About

This directory contains code to build a singularity nmag container based on Ubuntu 12.04.

# Dependencies

* [Singularity](https://sylabs.io/guides/3.5/user-guide/installation.html)

# Building

In order to build the container run `sudo ./buildContainer.sh` from the current directory

# Using

You can execute a command from the container using `sudo singularity exec nmag.sif <command>`.
For example:
```
sudo singularity exec nmag.sif nsim
```
