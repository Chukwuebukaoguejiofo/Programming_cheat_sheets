### https://hub.docker.com/
```
DockerHub is like github, but for images, so you can create your own images!
```


### Images
```
An image is a blueprint
An image is an inert, immutable, file that's essentially a snapshot of a container. 
Images are created with the build command, and they'll produce a container when started with run. 
Images are stored in a Docker registry such as registry.hub.docker.com
```

```bash
$ docker search ubuntu
$ docker pull <image> # Download images from docker hub
$ docker images # List downloaded images


# create you own image, notice the '.' specifying the folder where the 'Dockerfile' is in
$ docker build -t <my-docker-username>/<name-for-new-image>  . # example: $ docker build -t brianspinos777/my_foo_image
$ docker run -it <my-docker-username>/<name-for-new-image> /bin/bash # start a shell session

```

### Containers
```
A container is an instance of an image
```

```bash
$ docker run <image> <command> # Create a container (boot and exit)
$ docker run --rm  <image> <command> # Create a container (boot and exit) and also deletes it (it is a good practice!)
$ docker run -it <image> sh # create a container and start a shell session
$ docker ps # Show running containers
$ docker ps -a # show all containers
$ docker start <container-id> # Restart a container
$ docker rm <container-id> # delete container

$ docker attach <container-id> # start a shell session, to exit, press CTRL + C
```


