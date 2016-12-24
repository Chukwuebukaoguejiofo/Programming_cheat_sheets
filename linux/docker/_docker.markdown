### DOCKER
```
https://www.youtube.com/watch?v=UV3cw4QLJLs
```

```bash
$ docker images # list images


$ docker run -it ruby:2.3.3 /bin/bash # create a container from an image called 'ruby', version '2.3.3'


# Stop the container without quitting
# CTRL + P + Q 


$ docker ps # list containers


$ docker attach <container-id-or-name> # to get back inside the container, even to the last folder


# STOP running container! it will not show up in the `docker ps` command, just on the `docker ps -a`
# CTRL + D  


$ docker start <container-id-or-name> # restart the previously stopped container, but does not go in it.
$ docker ps # also shows that its running again!


$ docker stop <container-id-or-name> # stop the container
$ docker ps # shows that its not there anymore! only on `docker ps -a`
```
