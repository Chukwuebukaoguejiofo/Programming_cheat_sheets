### Image
```
An image is a blueprint
An image is an inert, immutable, file that's essentially a snapshot of a container. 
Images are created with the build command, and they'll produce a container when started with run. 
Images are stored in a Docker registry such as registry.hub.docker.com
```

### Container
```
A container is an instance of an image
```


### Images
```bash
$ docker search ubuntu
$ docker pull <image> # Download images from docker hub
$ docker images # List downloaded images
```

### Containers
```bash
$ docker run <image> <command> # Create a container (boot and exit)
$ docker run --rm  <image> <command> # Create a container (boot and exit) and also deletes it (it is a good practice!)
$ docker run -it <image> sh # create a container and start a shell session
$ docker ps # Show running containers
$ docker ps -a # show all containers
$ docker start <container-id> # Restart a container
$ docker rm <container-id> # delete container
```


