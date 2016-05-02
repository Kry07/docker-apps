#!/bin/bash

# Original Author: Erik Kristensen
# Modified by Kry07
# License: MIT

CONTAINER=skypd

# delete image
if [ "$1" == "--stop" -o "$1" == "-s" ]; then
	docker stop $CONTAINER
	docker rm $CONTAINER
	exit 0;
fi

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

# create instance of image
# --volume $HOME/dl:$HOME/Downloads 
# --volume /dev/video0:/dev/video0 
# --volume $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
if [ $? -eq 1 ]; then
	xhost +si:localuser:$USER
	docker run \
		--name $CONTAINER \
		--device=/dev/video0 \
		--volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
		kry07/skype
fi

# start server image
if [ "$RUNNING" == "false" ]; then
	docker start $CONTAINER
fi
