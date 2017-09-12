# Docker image for JSHint checker

[JSHint](http://jshint.com/) is a community-driven tool to detect errors and potential problems in JavaScript code  

## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.jshint/blob/master/Dockerfile)
- [`2.9.5` (*Dockerfile*)](https://github.com/eea/eea.docker.jshint/blob/2.9.5/Dockerfile)

## Usage

    $ docker run -it --rm -v /path/to/javascript/code:/code eeacms/jshint

or

    $ docker run --rm eeacms/jshint https://github.com/eea/eea.alchemy.git

## Advanced usage

Exclude directories:


    $ docker run --rm -e GIT_SRC="https://github.com/eea/eea.alchemy.git" \
             eeacms/jshint --exclude **/_static /code


See `--help` for more options:


    $ docker run --rm eeacms/jshint --help
