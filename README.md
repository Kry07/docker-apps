# docker-apps
docker applications based on [kry07/xorg](https://github.com/Kry07/docker-xorg).

Each branch is one applicaion.

 - [firefox with pulseaudio](https://github.com/Kry07/docker-apps/tree/firefox)
 - [firefox-flash with pulseaudio and flashplayer](https://github.com/Kry07/docker-apps/tree/firefox-flash)

### run Firefox
```
xhost +si:localuser:$USER
docker run --name=firefox-run \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	-v $HOME/Downloads:/home/user/Downloads \
	kry07/firefox:43.0.4 "$@"
```

### copy Firefox into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./firefox.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/firefox:43.0.4 sh
docker cp getIcon:/opt/firefox/browser/icons/mozicon128.png $HOME/.local/share/icons/
docker rm getIcon 
```
Licensed under [MIT License](LICENSE)
