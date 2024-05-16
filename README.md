# ubuntu-xrdp-base-image
Base Image for Ubuntu, for use behind guacamole

Change these in the Dockerfile, or provide via a .env file as you like:
``` 
ARG LOCALUSER="i_am_not_a_user_name"
ARG LOCALPASS="I_am_not_a_password"
```

Then build the container.
```
docker build -t ubuntu-xrdp-base .
docker run -d --name ubuntu-desktop -p 13389:3389 ubuntu-xrdp-base 

```

Connect via RDP to localhost:13389. ([your_docker_server]:13389)

## Public Docker Image
There is a public image to see if it works for you at docker/daemonchild/ubuntu-xrdp-base.
**Passwords are as above, so do not use in production unmodified.**