# siggame/colisee-docker

Docker in docker for running and building Joueur clients securely.

[![Travis](https://img.shields.io/travis/siggame/colisee-docker.svg?style=flat-square)](https://travis-ci.org/siggame/colisee-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/siggame/colisee-docker.svg?style=flat-square)](https://hub.docker.com/r/siggame/colisee-docker/)
[![GitHub Tag](https://img.shields.io/github/tag/siggame/colisee-docker.svg?style=flat-square)](https://github.com/siggame/colisee-docker/tags)
[![Dependencies](https://img.shields.io/david/siggame/colisee-docker.svg)](https://github.com/siggame/colisee-docker)

## Table Of Contents

- [Description](#description)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Secure Build](#secure-build)
- [Secure Runtime](#secure-runtime)
- [Contributors](#contributors)
- [Change Log](#change-log)
- [License](#license)
- [Contributing](#contributing)

## Description

Joueur clients contain untrusted code. The clients should be isolated from other colisee infrastructre. Isolation is important
because it will keep colisee running smoothly which leads to a better experience for competitors. Building is also a point where
colisee is exposed to risk so building in a secure environment is also necessary.

## Getting Started

Install [docker](https://www.docker.com/get-docker).

## Usage

```sh
> docker run -v `pwd`/.env.runtime:/tmp/.env:ro --privileged siggame/colisee-docker:secure-runtime
> docker run -v `pwd`/.env.build:/tmp/.env:ro --privileged siggame/colisee-docker:secure-build
```

The daemons are available on port `2375/tcp`.

## Secure Build

Containers are not allowed to communicate with other containers under this daemon.

### Secure Build Dotenv

- `REGISTRY_HOST`: the hostname for the [docker registry]
- `REGISTRY_PORT`: the port where the registry is listening

## Secure Runtime

Client containers are placed on their own network which is restricted from accessing external network resources.
External communication is resricted to only the game server. The firewall rule for the
port and ip at which the game server is available is configurable with a `.env` file mounted by volume into the
container at `/tmp/.env`. Similarly, [colisee-runner](siggame/colise-runner) is allowed to communicate into the
docker daemon by a firewall rule configurable by the `.env` file.

### Secure Runtime Dotenv

- `GAME_SERVER_HOST`: the hostname for the game server
- `GAME_SERVER_PORT`: the port which the game server is listening for client connections
- `REGISTRY_HOST`: the hostname for the [docker registry]
- `REGISTRY_PORT`: the port where the registry is listening
- `RUNNER_HOST`: the hostname for the runner

[docker registry]: (https://docs.docker.com/registry/)

## Contributors

- [user404d](https://github.com/user404d)

## Change Log

View our [CHANGELOG.md](https://github.com/siggame/colisee-docker/blob/master/CHANGELOG.md)

## License

View our [LICENSE](https://github.com/siggame/colisee/blob/master/LICENSE)

## Contributing

View our [CONTRIBUTING.md](https://github.com/siggame/colisee/blob/master/CONTRIBUTING.md)
