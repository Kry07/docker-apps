# docker-apps
docker applications based on kry07/xorg

Each branch is one Applicaion

 - firefox with pulseaudio
 - firefox-flash with pulseaudio and flashplayer

### Run Firefox
```
xhost +si:localuser:$USER
docker run --name=firefox-run \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	-v $HOME/Downloads:/home/user/Downloads \
	kry07/firefox:43.0.4 "$@"
```

### copy Firefox into your System
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./firefox.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/firefox:43.0.4 sh
docker cp getIcon:/opt/firefox/browser/icons/mozicon128.png $HOME/.local/share/icons/
docker rm getIcon 
```
