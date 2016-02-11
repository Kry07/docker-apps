#### Installation

##### How to get this Container
```
docker pull kry07/firefox
```

### run Firefox
```
xhost +si:localuser:$USER
docker run --rm \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	-v $HOME/Downloads:/home/user/Downloads \
	kry07/firefox "$@"
```

### copy Firefox into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./firefox.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/firefox sh
docker cp getIcon:/opt/firefox/browser/icons/mozicon128.png $HOME/.local/share/icons/
docker rm getIcon 
```
