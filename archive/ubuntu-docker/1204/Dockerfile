from ubuntu:12.04

workdir /home/nmag

env NMAG_VERSION 0.2.1

run \
	# Install dependencies
	apt-get update && \
	apt-get install -y wget dpkg-dev g++ libblas-dev libreadline-dev make m4 gawk zlib1g-dev readline-common liblapack-dev
	
run \
	# Initialize Environment
	useradd nmag && \
	chown -R nmag:nmag . && \
	wget http://nmag.soton.ac.uk/nmag/0.2/download/all/nmag-$NMAG_VERSION.tar.gz && \
	tar xzvf nmag-$NMAG_VERSION.tar.gz && \
	chown -R nmag:nmag nmag-$NMAG_VERSION

run \
	# Compile code
	su - nmag -c "cd nmag-$NMAG_VERSION && make && make clean"

run \
	# Link binaries
	ln -sf /home/nmag/nmag-$NMAG_VERSION/bin/* /usr/bin

run \
	# Clean up
	apt-get purge -y wget && \
	rm nmag-$NMAG_VERSION.tar.gz

entrypoint su - nmag
