build:
	docker build -t nmag-12.04 -f Dockerfile .

run:
	docker run --rm -ti -v `pwd`:/io nmag-12.04

sphere1:
	docker run --rm -v `pwd`:/io nmag-12.04 su - nmag -c "cd /io && nsim sphere1.py"

test: clean sphere1

clean:
	rm -f *dat.h5 *.ndt *.log
