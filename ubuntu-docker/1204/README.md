# About

This directory contains code to build a docker nmag container based on Ubuntu 12.04.

# Dependencies

* [Docker](https://docs.docker.com/install/)

# Building

In order to build the container run `docker build -t nmag .` from the current directory

# Using

You can start the nmag environment using `docker run -it nmag`.
To give the nmag environment access to the current directory and its children, use the format `docker run -it -v $PWD:/mnt nmag`.

# Testing

Use the sphere1 simulation included in the current directory to test the container like so:
```
docker run -it -v $PWD:/mnt nmag
$ nsim sphere1.py
```
