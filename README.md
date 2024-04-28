# FireDock Config

How to run firefox from a docker container

```shell
docker build -t firedock firedock -m 512m .

sudo xhost +local:docker
sudo xhost +


docker run -it -e DISPLAY=$DISPLAY --name firedock -v /tmp/.X11-unix/:/tmp/.X11-unix -v /home/hugo/Downloads:/home/developer/downloads --net=host -d firedock

```

> [Main reference](https://medium.com/codex/running-gui-applications-in-docker-firefox-nautilus-file-manager-5424694104ec)
