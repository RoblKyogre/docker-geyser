# docker-geyser
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/KiyoNetcat/docker-geyser/docker-ci.yml)](https://github.com/KiyoNetcat/docker-geyser/actions/workflows/docker-ci.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/roblkyogre/docker-geyser)](https://hub.docker.com/r/roblkyogre/docker-geyser)
[![Docker Image Version (tag)](https://img.shields.io/docker/v/roblkyogre/docker-geyser/latest)](https://hub.docker.com/r/roblkyogre/docker-geyser/tags)

[Geyser](https://geysermc.org/) as a Docker Container

[Docker Hub](https://hub.docker.com/r/roblkyogre/docker-geyser/) | [GitHub Repo](https://github.com/KiyoNetcat/docker-geyser/)

## Running

- Download the `docker-compose.yml` file:
  ```
  wget https://github.com/KiyoNetcat/docker-geyser/raw/main/docker-compose.yml
  ```

- Edit `docker-compose.yml` to fit your preferences.

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
