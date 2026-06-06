
build:
	# docker build -t firedock firedock -m 512m .
	docker build -t firedock -m 1024m .

run:
	docker run -it -e DISPLAY=$DISPLAY --name firedock -v /tmp/.X11-unix/:/tmp/.X11-unix -v /home/hugo/Downloads/firedock:/root/Downloads --net=host -d firedock