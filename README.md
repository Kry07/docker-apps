##### Installation

#### How to get this Container
```
docker pull kry07/none
```

#### run none
```
xhost +si:localuser:$USER
docker run --rm \
	--device=/dev/sr0 \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	-v $HOME:/home/user \
	kry07/none "$@"
```

#### copy none into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./none.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/none sh
docker cp getIcon:/usr/share/icons/none.png $HOME/.local/share/icons/
docker rm getIcon 
```
