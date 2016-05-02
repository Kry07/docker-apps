##### Installation

#### How to get this Container
```
docker pull kry07/skype
```

#### run skype
see skype.sh 
``` ./skype.sh ```

#### copy skype into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./skype.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/skype sh
docker cp getIcon:/usr/share/icons/skype.png $HOME/.local/share/icons/
docker rm getIcon 
```
