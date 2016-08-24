#!/bin/bash

# Original Author: Erik Kristensen
# Modified by Kry07
# License: MIT

CONTAINER=firefox-flash
NAME=flashd

# delete image
if [ "$1" == "--clear" -o "$1" == "-s" ]; then
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
fi

# start server image
if [ "$RUNNING" == "false" ]; then
	docker start $NAME
fi

docker exec $NAME firefox --setDefaultBrowser $@
