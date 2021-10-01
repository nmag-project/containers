from ubuntu:12.04

env NMAG_VERSION 0.2.1

run \
	# Switch out repository references for old releases and install dependencies
	sed -i -re 's/([a-z]{2}\.)?security.ubuntu.com|archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
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

# directory with short name to mount host file system in
run mkdir /io

run \
	# for mounting /io as user later:
	## the next line doesn't work (wrong user id)
	# chown -R nmag:nmag /io
	## set the userid manually (nmag as first added user is 1000)
	chown -R 1000:1000 /io

WORKDIR /io
cmd su nmag
