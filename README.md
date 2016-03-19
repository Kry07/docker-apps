##### Installation

#### How to get this Container
```
docker pull kry07/none
```

#### run none
see none.sh 
``` ./none.sh ```

#### copy none into your system
```
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/ 
cp ./none.desktop $HOME/.local/share/applications/
docker run --name=getIcon kry07/none sh
docker cp getIcon:/usr/share/icons/none.png $HOME/.local/share/icons/
docker rm getIcon 
```
