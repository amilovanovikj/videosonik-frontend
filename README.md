# Videosonik Frontend App

This repository is a Dockerized and somewhat modified version of the following app: [vavramovski/videosonik-frontend](https://github.com/vavramovski/videosonik-frontend). 

Huge thanks to [vavramovski](https://github.com/vavramovski) for letting me use this app for my [Ansible/Docker project](https://github.com/amilovanovikj/videosonik-devops).

## What was changed

- All package and deploy operations, as well as server setup, are done using [Ansible playbooks](https://github.com/amilovanovikj/videosonik-devops/tree/master/playbooks).
- Added the [Dockerfile](https://github.com/amilovanovikj/videosonik-frontend/blob/master/Dockerfile) where I use multi-stage build to first package this app using Node based image, and then run it in a lightweight, Nginx based Docker container.
- Added an [Nginx config file](https://github.com/amilovanovikj/videosonik-frontend/blob/master/nginx.conf), defining how to run this app in the Nginx based Docker container.
- During deploy time, the base URL in [src/axios/custom-axios.js](https://github.com/amilovanovikj/videosonik-frontend/blob/master/src/axios/custom-axios.js) is changed to correspond to the instance running the [backend app](https://github.com/amilovanovikj/videosonik-backend).
- During deploy time, multiple containers of this app are created, alongiside a load balancer that distributes the traffic between them, using a [Docker compose file](https://github.com/amilovanovikj/videosonik-devops/blob/master/playbooks/templates/docker-compose.yml.j2).

