##### Installation

#### How to get this Container
```
docker pull kry07/thunderbird
```

#### copy Thunderbird into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./thunderbird.desktop $HOME/.local/share/applications/
cp ./thunderbird.sh $HOME/bin/
docker run --name=getIcon kry07/thunderbird sh
docker cp getIcon:/opt/thunderbird/chrome/icons/default/default48.png $HOME/.local/share/icons/
mv $HOME/.local/share/icons/default48.png $HOME/.local/share/icons/thunderbird.png
docker rm getIcon 
```

#### Bug
There is a bug i could not fix:
`###!!! ABORT: X_ShmPutImage: BadValue (integer parameter out of range for operation)`
simply start again and then it disapears
