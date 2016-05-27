#!/bin/bash

# Original Author: Erik Kristensen
# Modified by Kry07
# License: MIT

CONTAINER=firefox
NAME=foxd

# delete image
if [ "$1" == "--stop" -o "$1" == "-s" ]; then
	docker stop $NAME
	docker rm $NAME
	exit 0
fi

RUNNING=$(docker inspect --format="{{ .State.Running }}" $NAME 2> /dev/null)

# create instance of image
if [ $? -eq 1 ]; then
	xhost +si:localuser:$USER
	docker run \
		--name $NAME \
		--detach \
		--tty \
		--volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
		--volume $HOME/Downloads:/home/user/Downloads \
		kry07/$CONTAINER sh
	docker exec $NAME firefox
fi

# start server image
if [ "$RUNNING" == "false" ]; then
	docker start $NAME
	docker exec $NAME firefox
fi

docker exec $NAME firefox --setDefaultBrowser $@
