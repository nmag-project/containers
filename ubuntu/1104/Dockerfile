FROM zoobab/ubuntu-oneiric-11.10-x86_64
RUN apt-get update && apt-cache search zlib1g && apt-get install -y libreadline6 readline-common build-essential m4 gawk zlib1g libatlas-base-dev wget nano
RUN mkdir -p /io/nmag
WORKDIR /io
RUN wget http://nmag.soton.ac.uk/nmag/0.2/download/all/nmag-0.2.1.tar.gz && tar xvzf nmag-0.2.1.tar.gz && rm nmag-0.2.1.tar.gz
WORKDIR /io/nmag-0.2.1
# RUN make all:
RUN make hlib-check
RUN make deps-check
# RUN make anyway
RUN make .deps_nsim_install
RUN make python_tools
RUN make create-bin-links
RUN make hints
