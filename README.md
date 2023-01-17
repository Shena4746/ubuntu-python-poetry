# shena4746/ubuntu-python-poetry

A docker image for python projects.

- Ubuntu:jammy (22.04)
- python installed via pyenv
- poetry
- git

The image is maintained in [github](https://github.com/Shena4746/ubuntu-python-poetry).

## Install

The image is available on Docker Hub.

```bash
docker pull shena4746/ubuntu-python-poetry:3.11.1
```

## Change python version

You can do that just by specifying `PYTHON_VERSION=` in `./.env`, and then `make build`. The specified python version should be available by the latest pyenv.
