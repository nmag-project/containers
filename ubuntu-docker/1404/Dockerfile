from ubuntu:14.04

workdir /mnt

env NMAG_VERSION 0.2.1

run \
	# Install dependencies
	apt-get update && \
	apt-get install -y wget dpkg-dev g++ libblas-dev libreadline-dev make m4 gawk zlib1g-dev readline-common liblapack-dev
	
run \
	# Initialize Environment
	useradd -m -s /bin/bash nmag && \
	cd /home/nmag && \
	wget --no-check-certificate https://github.com/fangohr/nmag-releases/raw/master/0.2/all/nmag-0.2.1.tar.gz && \
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
	rm /home/nmag/nmag-$NMAG_VERSION.tar.gz

cmd su nmag
