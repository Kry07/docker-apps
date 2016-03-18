##### Installation

#### How to get this Container
```
docker pull kry07/firefox
```

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
