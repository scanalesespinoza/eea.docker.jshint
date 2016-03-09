# Docker image for JSHint checker

[JSHint](http://jshint.com/) is a community-driven tool to detect errors and potential problems in JavaScript code  

## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.jshint/blob/master/Dockerfile)
- [`2.9.1` (*Dockerfile*)](https://github.com/eea/eea.docker.jshint/blob/2.9.1/Dockerfile)

## Usage

```console
$ docker run -it --rm -v /path/to/javascript/code:/code eeacms/jshint
```

## Advanced usage

Exclude directories:

```console
$ docker run -it --rm -v /path/to/javascript/code:/code eeacms/jshint --exclude **/_static /code
```

See `--help` for more options:

```console
$ docker run --rm eeacms/jshint --help
```
