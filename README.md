# Base Ubuntu Docker Image

This is the base image I use for most of my other docker images. Essentially it
is just the standard Ubuntu base image, with some build tools, essential
libraries and a non-root user called "default", which has sudo rights.

## Usage

It's not intended to use this docker image by itself. See my other \*-docker
projects for examples.
