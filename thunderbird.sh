#!/bin/bash

# Original Author: Erik Kristensen
# Modified by Kry07
# License: MIT

CONTAINER=thunderbird
NAME=tbird

# delete image
if [ "$1" == "--stop" -o "$1" == "-s" ]; then
	docker stop $NAME
	docker rm $NAME
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
		--env TZ=Europe/Vienna \
		--volume $HOM/.thunderbird:/home/user/.thunderbird \
		--volume $HOME/Desktop:/home/user/Desktop \
		kry07/$CONTAINER sh
	docker exec $NAME thunderbird
fi

# start server image
if [ "$RUNNING" == "false" ]; then
	docker start $NAME
	docker exec $NAME thunderbird
fi

docker exec $NAME thunderbird $@
