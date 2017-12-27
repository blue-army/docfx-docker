# docfx-docker

Image contains the required assemblies to generate docfx documentation.

## Run

Mount the base folder into the container and pass in the path to the `docfx.json` file.

```sh
docker run --mount type=bind,source="$(pwd)",target=/work nullreference/docfx-docker /work/docfx.json
```
