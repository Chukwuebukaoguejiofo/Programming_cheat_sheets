### DOCKER
```
https://www.youtube.com/watch?v=UV3cw4QLJLs
```

```bash
$ docker images # list images


# create a container from an image called 'ruby', version '2.3.3',
# and run bash
$ docker run -it ruby:2.3.3 /bin/bash 


# Stop the container without quitting
# CTRL + P + Q 


# list containers
$ docker ps 


# to get back inside the container, even to the last visited folder
$ docker attach <container-id-or-name> 


# STOP running container! it will not show up in the `docker ps` command, just on the `docker ps -a`
# CTRL + D  


# restart the previously stopped container, but does not go in it.
$ docker start <container-id-or-name> 
$ docker ps # also shows that its running again!


# stop the container
$ docker stop <container-id-or-name> 
$ docker ps # shows that its not there anymore! only on `docker ps -a`
```
