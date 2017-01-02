### docker main tutorial

```
images are snapshots of a system (a picture of the state of the system)
containers are running instances of an image
```

###### commands
```bash

# list images
$ docker images

# list all containers
$ docker ps -a

# create an image, from a Dockerfile in the current folder
$ docker build -t <my-new-image-name> .

# delete image
$ docker rmi <image>

# run a container based on an image
$ docker run -it --name <my-new-container-name> <image>

# Stop the container without quitting
# CTRL + P + Q 

# STOP running container! it will not show up in the `docker ps` command, just on the `docker ps -a`
# CTRL + D  

# delete container
$ docker rm <container>

# start, stop, restart, pause, unpause a container:
$ docker start <container>
$ docker stop <container>
$ docker restart <container>
$ docker pause <container>
$ docker unpause <container>

# these commands were not tested
$ docker wait <container>
$ docker kill <container>

# start a shell session in that container. (container needs to be started)
$ docker attach <container>  

# create an image from a container
$ docker commit <container> <new-image-name>

```
