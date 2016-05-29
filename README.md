Mozilla Firefox[]

Visit my github repository to get the executing script and .desktop file.

I created this conteiner to surf safly the web. So the Browser has no connection to files or system.
It is also simple to make a new instance, which would be like a clean new installation.

Somtimes we want that firefox remembers our hitory. See the script file.
The Container rnus in the background and everytime you klick on a Link or
the .desktop File is executed, the same instance reapears.
This works perfectly, so you cant see a difference in Linux system between
normaly installed or docker executed. How to integrate it in your system see section below.

#### run Firefox
```
./firefox.sh
```

#### copy Firefox into your system
```
mkdir -p $HOME/.local/share/applications
mkdir -p $HOME/.local/share/icons 
cp ./firefox.desktop $HOME/.local/share/applications
cp ./firefox.sh $HOME/bin
docker run --name=getIcon kry07/firefox sh
docker cp getIcon:/opt/firefox/browser/icons/mozicon128.png $HOME/.local/share/icons
docker rm getIcon 
```
