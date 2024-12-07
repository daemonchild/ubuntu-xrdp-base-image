# ubuntu-xrdp-base-image
## Ubuntu Desktop Container with XRDP

This is a lightweight desktop base image for use behind Apache Guacamole.
It is based on Ubuntu 18:04, and is an approx 1.4Gb image.

The default username and password are deliberately terrible.

**You really, really MUST change them!**

```
ARG LOCALUSER="user"
ARG LOCALPASS="b4d_p4ssw0rd"
```

Change them in the Dockerfile, or remove these lines and provide these values via a .env file as you like.


Then build the container. From the container directory:
```
docker build -t daemonchild/ubuntu-xrdp-base .
docker run -d --name ubuntu-desktop --privileged -p 13389:3389 ubuntu-xrdp-base 
```
NB: It is only Google Chrome that requires the 'privileged' capability. If you don't want to use it, you won't need this runtime flag.


Connect via RDP to [your_docker_server]:13389

![Desktop via RDP](https://github.com/daemonchild/ubuntu-xrdp-base-image/blob/master/docs/ubuntu-xrdp-desktop.png "Desktop via RDP")


## Prebuilt Image

I have uploaded a prebuilt image to the Docker Hub using the configuration as provided. This is only intended for you to see whether this image works for you. You are strongly encouraged to build your own image from these souces.

**Warning: Passwords are as above, so do not use in production unmodified.**

You can pull the image as follows:

```
docker pull daemonchild/ubuntu-xrdp-base-image:latest
```

