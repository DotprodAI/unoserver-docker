# Unoserver Docker Image

Docker image for unoserver. This image is designed to be used as a server and consummed by a [Python client](https://github.com/unoconv/unoserver/blob/master/src/unoserver/client.py).

## The environment

This Docker image uses Alpine Linux as base image and provides:

- [LibreOffice](https://www.libreoffice.org/)

- [unoserver](https://github.com/unoconv/unoserver)

- Fonts (alpine packages)
  - font-noto
  - font-noto-cjk
  - font-noto-extra
  - terminus-font
  - ttf-font-awesome
  - ttf-dejavu
  - ttf-freefont
  - ttf-hack
  - ttf-inconsolata
  - ttf-liberation
  - ttf-mononoki 
  - ttf-opensans  

## How to use it

Just run:

    docker run -v <your directory>:/tmp/ ghcr.io/unoconv/unoserver-docker

Docker maps your directory with /tmp directory in the container.

You might need to add the option `:z` or `:Z` like `<your directory>:/tmp/:z` or `<your directory>:/tmp/:Z` if you are using SELinux. See [Docker docs](https://docs.docker.com/storage/bind-mounts/#configure-the-selinux-label) or [Podman docs](https://docs.podman.io/en/latest/markdown/podman-run.1.html#volume-v-source-volume-host-dir-container-dir-options).

## How to contribute / do it yourself?

### Requirements

You need the following tools:

- A bash compliant command line
- Docker installed and in your path

### How to build

    docker build .
