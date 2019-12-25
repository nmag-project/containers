FROM ubuntu:14.04
RUN apt-get update && apt-cache search zlib1g && apt-get install -y libreadline6 readline-common build-essential m4 gawk zlib1g libatlas-base-dev wget nano python
RUN mkdir -p /io/nmag
WORKDIR /io
RUN wget http://nmag.soton.ac.uk/nmag/0.2/download/all/nmag-0.2.1.tar.gz && tar xvzf nmag-0.2.1.tar.gz && rm nmag-0.2.1.tar.gz
WORKDIR /io/nmag-0.2.1
# RUN make all:
RUN make hlib-check
RUN make deps-check
# RUN make anyway

#RUN make .deps_nsim_install

RUN make .deps_ocaml_all
RUN make .deps_qhull_install
RUN make .deps_mpich2_install .deps_petsc_setup
RUN make .deps_parmetis_install .deps_python_install
RUN make .deps_sundials_install
RUN make exports.bash $(NSIM_LDFLAGS_FILE) nsim/interface/nsim/configuration.py
#RUN make .deps_nsim_install
	#. ./exports.bash && cd nsim && ${MAKE} all-log install && cd ..
RUN . ./exports.bash && cd nsim && make all-log  && cd ..
RUN . ./exports.bash && cd nsim && make install && cd ..
	#touch .deps_nsim_install



#RUN make python_tools
#RUN make create-bin-links
#RUN make hints
