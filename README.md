# Running nuclio on premise
A small repo documenting my experience in setting up nuclio for local development

## On premise setup
You will need a couple of things for on premise nuclio
1. A local docker registry
2. The downloadable images that the make file will later push to the local image

In order to setup a on premise nuclio just run 
1. `make setup-local-registry`
2. `make start`

## Python custom runtime
All nuclio needs for a custom run time is an image with python3 installed.
For an example you can checkout the `build-runtime-image` in the makefile.

In order to build and push a custom runtime run `make push-runtime-image`.
After that you can configure the runtime at the functions configuration tab under `base-image`.

## Gotchas
Nuclios documentation is quite lacking.
I strongly suggest looking at `dasboard/main.go` file at their repo for a detailed list of configurations.

