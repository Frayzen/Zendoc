---
title: "Lesson 3"
---
Last edited time: June 2, 2025 3:38 PM

### Run containers

- to run a container with docker, we use:

```bash
docker run
```

- To check for running containers, we use:

```bash
docker ps
```

Demonstration: 

[docker CLI example : start and see containers and images](https://asciinema.org/a/489561)

- How to see all the images in local ?

```bash
docker image ls
```

- 1 image can have several tags

### Building a docker image

An image is a combination of

- A file system
    - The “main” binary
    - Its libraries, essential files…
    - Other binaries
- Some metadatas
    - How it was built
    - What command to run by default
    - Some environment variable to set

Dockerfile

```docker
FROM docker.io/library/python:3.11-alpine
WORKDIR /app
COPY requirements.txt requirements.txt
RUN echo toto > password
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "r_planner"]
```

Each line is a “layer”

It uses cache.

The first COPY is for downloading the lib for the project.

Spliting the copy allows to not download all the lib when you modify a file that is not in the requirements.txt.

If you don’t do that, you will install all the lib when you build the docker (that is not what we want)

### Layering

An image is a superposition of layers, When you create a container, it stacks all the layers from an image.

```bash
docker inspect <image>
```

The order of the layers matters.

### Image, tag, repository

- A docker image is defined by a hash (sha256)
- A name can be set on a hash for references purposes
- But a name can have multiple version, so we can append a tag
- example: debian:11, python3

### Container isolation

Isolation via 2 syscall:

- chroot(2)
    - change the root of the directory for a process
    - prevent the process from accessing anything not in its root
- namespaces(7)
    - create a namespace of a kind for a process  (and its children)
    - hierarchical approach
    - kind of namespace:
        - Network
        - Mount
        - PID
        - User

### Container isolation boxes

![Untitled](Lesson%203/Untitled.png)

![Untitled](Lesson%203/Untitled%201.png)

![Untitled](Lesson%203/Untitled%202.png)

![Untitled](Lesson%203/Untitled%203.png)

![Untitled](Lesson%203/Untitled%204.png)
