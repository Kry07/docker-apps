#### Installation

##### How to get this Container
```
docker pull kry07/handbrake
```

### run Handbrake
```
xhost +si:localuser:$USER
docker run --rm \
		--device=/dev/sr0 \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v $HOME/Videos:/home/user/Videos \
		kry07/handbrake "$@"
```

### copy Handbrake into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./ghb.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/handbrake sh
docker cp getIcon:/usr/share/icons/hicolor/scalable/apps/hb-icon.svg $HOME/.local/share/icons/
docker rm getIcon 
```
