---
Owner: "Florian "
---
# Docker
[[Docker]]

> [!important] The OS is managing isolation of the containers. On the other hand, virtualization is based on a “hypervisor” process.
  
==Kernel utilities to manage all of that:==
- _==cgroups==_==: resource management==
- _==chroot:==_ ==isolate filesystem==
- _==namespaces==_==: isolate system resources==
    - ==network==
    - ==users==
    - ==processes==
    - ==mounts==
# Container vs Image
**Container:** isolated space that shares the operating system of its host.

> [!important] Docker **standardized** the way of creating containers ([OCI](https://opencontainers.org/)).
An image is a container templpate. It conatins the initial filesystem.
In other words, **image = class | container = instance**
Images are shared in registries, a web service that stores collections of images. For instance, Docker has its official registry: **Docker Hub**.

> [!important] You can host you own registry: [http://registry.cri.epita.fr/](http://registry.cri.epita.fr/)
In term of naming convention:
==registry.url/path/name:tag==
- registry is optional, docker hub per default
- path can be empty
- tag is the version of the image (default is latest)
## Volumes
By default, the filesystem is not persistent. In order to have persistent filesystem, one should use **volumes**.
```Shell
$ docker run -v HOST_PATH:CONTAINER_PATH[:OPTION] #...
```

> [!important] The paths must be **absolute**
## Network
By default, the network of a container is isolated. In order to make a container access outside network. One should use a port mapping.
```Shell
$ docker run -p HOST_PORT:CONTAINER_PORT #...
```
  
# Dockerfile
A dockerfile is a recipe for building a docker image. It contains a sequence of instructions that docker runs at build time.

> [!important] A docker image is built on top of another image specified in the **FROM** statement
```Shell
FROM ubuntu:22.04
COPY . /app
RUN make /app
CMD python /app/app.py # see ENTRYPOINT if needs args of the docker run cmd 
```

> [!info] Dockerfile reference  
> Find all the available commands you can use in a Dockerfile and learn how to use them, including COPY, ARG, ENTRYPOINT, and more.  
> [https://docs.docker.com/reference/dockerfile/](https://docs.docker.com/reference/dockerfile/)  
```Shell
# A dockerfile is built using
$ docker build -t NAME:TAG
```
Every single line of the docker file is executed one by one and the state of the image is saved after every line.
As a good practice, one should write first the operations that are the less probable to change (such as downloading dependencies). Indeed, every line of the image depend on the execution of the **previous lines** of the image.
# Usage
```Shell
# create and run a new container from an image
$ docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
# option --rm deletes the container after exit
# option -ti enables interactive mode (tty + shell)
# In order to attach to the tty of a container after launch:
docker exec -ti CONTAINER_ID [command]
# listing running containers
$ docker ps -a
```