##### Installation

#### How to get this Container
```
docker pull kry07/vlc
```

#### run vlc
```
xhost +si:localuser:$USER
docker run --rm \
	--device=/dev/sr0 \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	-v $HOME/Videos:/home/user/Videos \
	kry07/vlc "$@"
```

#### copy vlc into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./vlc.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/vlc sh
docker cp getIcon:/usr/share/icons/hicolor/128x128/apps/vlc.png $HOME/.local/share/icons/
docker rm getIcon 
```
