Create a docker with debian 8, epics base 3.15.5 and medm 3.1.13

# How to use

To use medm it is necessary some configuration:

* Before run container execute:

`xhost localhost`

* Command to run :

docker container run --env="DISPLAY" -it --rm --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --net=host lnlssol/docker-medm bash

* Run medm:
```
./medm
```

* Normally to run medm it is necessary to use .adl files, and macros. For this could be necessary copy .adl to docker and pass macros as argument, like this:

`
./medm -x -macro "P=mcaTest:,R=Amptek1:, M=mca1" Amptek.adl & 
`
