# docker-apps
docker applications based on [kry07/xorg](https://github.com/Kry07/docker-xorg).

Each branch is one applicaion.

 - [firefox with pulseaudio](https://github.com/Kry07/docker-apps/tree/firefox)
 - [firefox-flash with pulseaudio and flashplayer](https://github.com/Kry07/docker-apps/tree/firefox-flash)
 - [handbrake-gtk](https://github.com/Kry07/docker-apps/tree/handbrake-gtk)

### run Handbrake
```
xhost +si:localuser:$USER
docker run --name=firefox-run \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v $HOME/Downloads:/home/user/Downloads \
        kry07/ghb "$@"
```

### copy Handbrake into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./ghb.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/ghb sh
docker cp getIcon:/usr/share/icons/hicolor/scalable/apps/hb-icon.svg $HOME/.local/share/icons/
docker rm getIcon 
```
Licensed under [MIT License](LICENSE)
