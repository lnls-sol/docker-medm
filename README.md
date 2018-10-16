Create a docker with debian 8, epics base 3.15.5 and medm 3.1.13

# How to use

To use medm it is necessary some configuration:

* Before run container execute:

`xhost localhost`

* Run container with paramater `run -v /tmp/.X11-unix:/tmp/.X11-unix` and `-e DISPLAY , like this:

docker container run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it --rm medm bash

* Inside container create your user, with the same id, some like this:

`adduser <username> --uid <id> --force-badname`

* Then change to your user, and run medm:
`
su <username>
./medm
`

