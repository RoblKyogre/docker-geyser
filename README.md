# docker-geyser
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/RoblKyogre/docker-geyser/docker-ci.yml)](https://github.com/RoblKyogre/docker-geyser/actions/workflows/docker-ci.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/roblkyogre/docker-geyser)](https://hub.docker.com/r/roblkyogre/docker-geyser)
[![Docker Image Version (tag)](https://img.shields.io/docker/v/roblkyogre/docker-geyser/latest)](https://hub.docker.com/r/roblkyogre/docker-geyser/tags)

[Geyser](https://geysermc.org/) as a Docker Container

[Docker Hub](https://hub.docker.com/r/roblkyogre/docker-geyser/) | [GitHub Repo](https://github.com/RoblKyogre/docker-geyser/)

## Running

- Download the `docker-compose.yml` and `docker.env` files:
  ```
  wget https://github.com/RoblKyogre/docker-geyser/raw/main/docker-compose.yml
  wget https://github.com/RoblKyogre/docker-geyser/raw/main/docker.env
  ```

- Edit `docker.env` to fit your preferences.

- After that, start the container with this command:
  ```
  docker compose up -d
  ```

- To stop the server, use this command:
  ```
  docker compose down
  ```

- To update the image, use this command:
  ```
  docker compose pull
  ```
