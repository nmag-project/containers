# Build, run, and test

build:
	docker build -t nmag-12.04 -f Dockerfile .

run:
	docker run --rm -ti -v `pwd`:/io nmag-12.04

sphere1:
	docker run --rm -v `pwd`:/io nmag-12.04 su - nmag -c "cd /io && nsim sphere1.py"

test: clean sphere1

# Upload to Dockerhub

login:
	docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}

tag:
	docker image tag nmag-12.04 nmag/nmag-12.04

push:
	docker image push nmag/nmag-12.04

publish: login tag push

clean:
	rm -f *dat.h5 *.ndt *.log
