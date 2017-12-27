# docfx-docker

A dockerfile for generating documentation using docfx.

Build

    docker build -t docfx .

Run

    `docker run --mount type=bind,source="$(pwd)",target=/work docfx /work/docfx.json`
