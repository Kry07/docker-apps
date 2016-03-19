#!/bin/bash

# Original Author: Erik Kristensen
# Modified by Kry07
# License: MIT

CONTAINER=empty

# delete image
if [ "$1" == "--stop" -o "$1" == "-s" ]; then
	docker stop empty
	docker rm empty
fi

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

# create instance of image
if [ $? -eq 1 ]; then
	xhost +si:localuser:$USER
	docker run \
		--name emptyd \
		--detach \
		--tty \
		--device=/dev/sr0 \
		--volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
		--volume $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
		kry07/empty sh
fi

# start server image
if [ "$RUNNING" == "false" ]; then
	docker start emptyd
fi

# run new instance of image
if [ "$RUNNING" == "true" ]; then
	docker exec emptyd
fi

