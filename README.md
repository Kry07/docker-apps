# docker-apps
docker applications based on kry07/xorg

Each branch is one Applicaion

 - firefox with pulseaudio
 - firefox-flash with pulseaudio and flashplayer

```
$ xhost +si:localuser:$USER
$ docker run -name=firefox \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	-v $HOME/Downloads:/home/user/Downloads \
	kry07/firefox "$@"
```

