# About

This directory contains code to build a docker nmag container based on Ubuntu 12.04.

# Dependencies

* [Docker](https://docs.docker.com/install/)

# Building

In order to build the container run `docker build -t nmag .` from the current directory

# Using

You can execute a command from the container using `docker run nmag <command>`.
For example:
```
docker run nmag nsim
```
To execute a command on a file in the current directory or a child of the current directory, use the format `docker run -v $PWD:. nmag <command> <dilename>`.
For example:
```
docker run -v $PWD:. nmag nsim simulation.py
```
